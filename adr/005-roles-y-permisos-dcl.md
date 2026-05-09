# ADR-005: Roles y permisos de base de datos (DCL)

## Estado

Aceptada

## Fecha

2026-05-06

---

## Contexto

El sistema hotelero distribuye sus 46 tablas en 7 schemas de dominio funcional (ADR-002). El acceso a esas tablas debe estar controlado a nivel de base de datos mediante una estrategia de roles y permisos PostgreSQL (DCL), independiente del control de acceso que implementa el módulo de seguridad a nivel de aplicación (`identity_security`).

Existen dos capas de control de acceso en el sistema:

- **Capa de aplicación**: gestionada por las entidades `usuario`, `rol`, `permiso`, `modulo` y `vista` del schema `identity_security`. Controla qué pantallas y acciones puede ejecutar cada usuario dentro del sistema hotelero.
- **Capa de base de datos**: gestionada mediante roles y `GRANT` de PostgreSQL. Controla qué conexiones pueden leer, escribir o administrar cada schema o tabla directamente en el motor.

Este ADR cubre exclusivamente la capa de base de datos.

Sin una estrategia DCL definida, todos los procesos que se conecten a PostgreSQL podrían usar el mismo usuario superadministrador, lo que elimina el principio de mínimo privilegio, expone datos sensibles (facturas, pagos, usuarios, contraseñas hash) a conexiones que no los necesitan y dificulta la auditoría de accesos al motor.

---

## Decisión

Se definen **4 roles de base de datos** con alcance y privilegios diferenciados. Ningún proceso de aplicación usará el usuario `postgres` ni ningún superusuario.

### Roles definidos

| Rol | Propósito | Tipo de acceso |
|---|---|---|
| `hotel_admin` | Administración del esquema y datos. Usado por Liquibase para migraciones. | DDL + DML completo sobre todos los schemas |
| `hotel_app` | Conexión de la aplicación en tiempo de ejecución. | DML (`SELECT`, `INSERT`, `UPDATE`, `DELETE`) sobre todos los schemas |
| `hotel_readonly` | Consultas de solo lectura. Reportes, integraciones externas, herramientas de BI. | `SELECT` sobre todos los schemas |
| `hotel_maintenance` | Operaciones de mantenimiento puntual. Usado por scripts de soporte o corrección. | DML restringido sobre schemas operativos (`rooms_reservations`, `maintenance`) |

---

## Definición de privilegios por schema

### `hotel_admin`

```sql
-- Privilegios sobre todos los schemas
GRANT ALL PRIVILEGES ON SCHEMA identity_security TO hotel_admin;
GRANT ALL PRIVILEGES ON SCHEMA company_operations TO hotel_admin;
GRANT ALL PRIVILEGES ON SCHEMA rooms_reservations TO hotel_admin;
GRANT ALL PRIVILEGES ON SCHEMA inventory_services TO hotel_admin;
GRANT ALL PRIVILEGES ON SCHEMA billing_payments TO hotel_admin;
GRANT ALL PRIVILEGES ON SCHEMA communication_loyalty TO hotel_admin;
GRANT ALL PRIVILEGES ON SCHEMA maintenance TO hotel_admin;

-- DDL y DML sobre todas las tablas actuales y futuras
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA identity_security TO hotel_admin;
ALTER DEFAULT PRIVILEGES IN SCHEMA identity_security GRANT ALL ON TABLES TO hotel_admin;
-- (repetir por cada schema)
```

### `hotel_app`

```sql
-- Acceso de uso a todos los schemas
GRANT USAGE ON SCHEMA identity_security TO hotel_app;
GRANT USAGE ON SCHEMA company_operations TO hotel_app;
GRANT USAGE ON SCHEMA rooms_reservations TO hotel_app;
GRANT USAGE ON SCHEMA inventory_services TO hotel_app;
GRANT USAGE ON SCHEMA billing_payments TO hotel_app;
GRANT USAGE ON SCHEMA communication_loyalty TO hotel_app;
GRANT USAGE ON SCHEMA maintenance TO hotel_app;

-- DML sobre todas las tablas actuales y futuras
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA identity_security TO hotel_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA identity_security GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO hotel_app;
-- (repetir por cada schema)
```

### `hotel_readonly`

```sql
-- Acceso de uso a todos los schemas
GRANT USAGE ON SCHEMA identity_security TO hotel_readonly;
GRANT USAGE ON SCHEMA company_operations TO hotel_readonly;
GRANT USAGE ON SCHEMA rooms_reservations TO hotel_readonly;
GRANT USAGE ON SCHEMA inventory_services TO hotel_readonly;
GRANT USAGE ON SCHEMA billing_payments TO hotel_readonly;
GRANT USAGE ON SCHEMA communication_loyalty TO hotel_readonly;
GRANT USAGE ON SCHEMA maintenance TO hotel_readonly;

-- Solo SELECT sobre todas las tablas actuales y futuras
GRANT SELECT ON ALL TABLES IN SCHEMA identity_security TO hotel_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA identity_security GRANT SELECT ON TABLES TO hotel_readonly;
-- (repetir por cada schema)
```

### `hotel_maintenance`

```sql
-- Acceso restringido a schemas operativos
GRANT USAGE ON SCHEMA rooms_reservations TO hotel_maintenance;
GRANT USAGE ON SCHEMA maintenance TO hotel_maintenance;

GRANT SELECT, UPDATE ON ALL TABLES IN SCHEMA rooms_reservations TO hotel_maintenance;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA maintenance TO hotel_maintenance;

ALTER DEFAULT PRIVILEGES IN SCHEMA rooms_reservations GRANT SELECT, UPDATE ON TABLES TO hotel_maintenance;
ALTER DEFAULT PRIVILEGES IN SCHEMA maintenance GRANT SELECT, INSERT, UPDATE ON TABLES TO hotel_maintenance;
```

---

## Usuarios de base de datos

Cada rol se asigna a un usuario de base de datos dedicado. Los usuarios no tienen privilegios directos: heredan todo desde el rol.

| Usuario | Rol asignado | Usado por |
|---|---|---|
| `liquibase_user` | `hotel_admin` | Liquibase en migraciones y rollbacks |
| `app_user` | `hotel_app` | Aplicación backend en tiempo de ejecución |
| `readonly_user` | `hotel_readonly` | Herramientas de reporte, BI, integraciones externas |
| `maintenance_user` | `hotel_maintenance` | Scripts de soporte y corrección operativa |

```sql
CREATE USER liquibase_user WITH PASSWORD '...' NOINHERIT;
GRANT hotel_admin TO liquibase_user;

CREATE USER app_user WITH PASSWORD '...' NOINHERIT;
GRANT hotel_app TO app_user;

CREATE USER readonly_user WITH PASSWORD '...' NOINHERIT;
GRANT hotel_readonly TO readonly_user;

CREATE USER maintenance_user WITH PASSWORD '...' NOINHERIT;
GRANT hotel_maintenance TO maintenance_user;
```

> Las contraseñas nunca se almacenan en texto plano en el repositorio. Se inyectan mediante variables de entorno en `docker-compose.yml` o en el sistema de secretos del entorno de despliegue (ver ADR-006).

---

## Organización de scripts DCL en el proyecto

Los scripts DCL residen en `db/dcl/` siguiendo la estructura definida en ADR-004:

```
db/dcl/
├── roles/
│   └── create_roles.sql          -- CREATE ROLE y CREATE USER
└── grants/
    ├── identity_security_grants.sql
    ├── company_operations_grants.sql
    ├── rooms_reservations_grants.sql
    ├── inventory_services_grants.sql
    ├── billing_payments_grants.sql
    ├── communication_loyalty_grants.sql
    └── maintenance_grants.sql
```

Todos los scripts DCL se registran en Liquibase como changeSets dentro del changelog master, ejecutándose después de los changeSets DDL y de asignación de schemas.

---

## Relación con el módulo de seguridad de la aplicación

El módulo `identity_security` de la aplicación controla el acceso funcional por usuario y rol dentro del sistema hotelero. El DCL de PostgreSQL controla el acceso al motor de base de datos. Ambas capas son independientes y complementarias:

- Un usuario de aplicación bloqueado en `identity_security.user` no puede iniciar sesión en el sistema, pero eso no afecta la conexión de `app_user` al motor.
- Una tabla protegida con `REVOKE` en PostgreSQL no puede ser consultada aunque el usuario de aplicación tenga permisos funcionales.

La capa DCL actúa como barrera de última línea ante accesos directos al motor que bypaseen la aplicación.

---

## Consecuencias

### Positivas

- Se aplica el principio de mínimo privilegio: cada conexión accede únicamente a lo que necesita.
- Liquibase opera con `hotel_admin` y la aplicación opera con `hotel_app`, reduciendo la superficie de riesgo ante errores o ataques.
- El rol `hotel_readonly` permite conectar herramientas externas de reporte o BI sin exponer operaciones de escritura.
- `ALTER DEFAULT PRIVILEGES` garantiza que las tablas creadas en el futuro hereden los permisos correctos sin intervención manual.
- Los scripts DCL quedan versionados en Liquibase junto con el resto del modelo.

### Negativas

- La gestión de `DEFAULT PRIVILEGES` en PostgreSQL aplica por propietario del schema, lo que puede generar comportamiento inesperado si se cambia el usuario que ejecuta las migraciones.
- Las contraseñas de los usuarios deben gestionarse fuera del repositorio mediante variables de entorno o un sistema de secretos.
- Si se añade un nuevo schema, los `GRANT` y `ALTER DEFAULT PRIVILEGES` deben extenderse explícitamente a ese schema para cada rol.

---

## Criterios de aceptación

- Los 4 roles (`hotel_admin`, `hotel_app`, `hotel_readonly`, `hotel_maintenance`) existen en la base de datos.
- Los 4 usuarios de base de datos existen y tienen asignado su rol correspondiente.
- Ningún proceso usa el usuario `postgres` ni un superusuario para operaciones de aplicación o migración.
- Los scripts DCL están registrados en Liquibase y se ejecutan después de los changeSets DDL.
- `app_user` puede ejecutar `SELECT`, `INSERT`, `UPDATE` y `DELETE` sobre todas las tablas de todos los schemas.
- `readonly_user` solo puede ejecutar `SELECT`.
- `liquibase_user` puede ejecutar DDL y DML sobre todos los schemas.
- `maintenance_user` solo accede a `rooms_reservations` y `maintenance`.
- Las contraseñas no están en texto plano en el repositorio.

---

## Decisiones relacionadas

- ADR-001: Migración a PostgreSQL como motor relacional del proyecto.
- ADR-002: Uso de schemas por dominio en PostgreSQL.
- ADR-004: Estructura de directorios del proyecto organizada por dominio.
- ADR-006: Configuración de entorno con Docker y Liquibase.
