# ADR-004: Estructura de directorios del proyecto organizada por dominio

## Estado

Aceptada

## Fecha

2026-05-06

---

## Contexto

El proyecto gestiona scripts SQL, changelogs de Liquibase, datos semilla, smoke tests y documentación técnica para un modelo de 46 tablas distribuidas en 8 dominios funcionales.

Sin una convención de estructura de directorios, los artefactos del proyecto tienden a acumularse en carpetas planas o a organizarse de forma inconsistente entre personas del equipo. Esto dificulta encontrar los scripts de una tabla específica, ejecutar migraciones selectivas por dominio, aplicar rollbacks parciales y mantener la trazabilidad entre la documentación y el código.

Los 8 dominios funcionales del sistema son:

| Dominio | Módulo funcional |
|---|---|
| `identity_security` | Seguridad |
| `company_operations` | Parametrización |
| `rooms_reservations` | Distribución y Prestación de servicio |
| `inventory_services` | Inventario |
| `billing_payments` | Facturación |
| `communication_loyalty` | Notificación |
| `maintenance` | Mantenimiento |
| `common` | Elementos transversales: schemas, auditoría, tipos compartidos |

El dominio `common` no corresponde a un módulo de negocio, pero agrupa los artefactos que no pertenecen a un único dominio funcional: la creación de schemas, la plantilla de campos de auditoría y cualquier tipo o función compartida entre dominios.

---

## Decisión

Se adopta una estructura de directorios organizada por **tipo de artefacto** en el primer nivel y por **dominio** en el segundo nivel. Todos los artefactos de un mismo dominio conviven bajo la misma carpeta de dominio dentro de su categoría.

### Estructura raíz del proyecto

```
project-root/
├── docs/
│   ├── adr/
│   └── domain/
├── db/
│   ├── changelog/
│   ├── ddl/
│   ├── dcl/
│   ├── dml/
│   └── tests/
├── docker/
└── README.md
```

### Detalle de `db/`

```
db/
├── changelog/
│   ├── db.changelog-master.xml
│   └── releases/
│       └── YYYY-MM-DD/
│           └── db.changelog-YYYY-MM-DD.xml
│
├── ddl/
│   ├── common/
│   │   ├── schemas/
│   │   │   └── create_schemas.sql
│   │   └── schema_assignments/
│   │       └── assign_tables_to_schemas.sql
│   ├── identity_security/
│   │   ├── person.sql
│   │   ├── user.sql
│   │   ├── role.sql
│   │   ├── permission.sql
│   │   ├── module.sql
│   │   ├── view.sql
│   │   ├── user_role.sql
│   │   ├── role_permission.sql
│   │   └── module_view.sql
│   ├── company_operations/
│   │   ├── customer.sql
│   │   ├── price.sql
│   │   ├── company.sql
│   │   ├── legal_information.sql
│   │   ├── employee.sql
│   │   ├── day_type.sql
│   │   └── payment_method.sql
│   ├── rooms_reservations/
│   │   ├── branch.sql
│   │   ├── room.sql
│   │   ├── room_type.sql
│   │   ├── room_status.sql
│   │   ├── room_reservation.sql
│   │   ├── reservation_cancellation.sql
│   │   ├── room_availability.sql
│   │   ├── room_catalog.sql
│   │   ├── check_in.sql
│   │   ├── check_out.sql
│   │   ├── stay.sql
│   │   ├── product_sale.sql
│   │   └── service_sale.sql
│   ├── inventory_services/
│   │   ├── product.sql
│   │   ├── service.sql
│   │   ├── supplier.sql
│   │   ├── product_tracking.sql
│   │   └── inventory_availability.sql
│   ├── billing_payments/
│   │   ├── pre_invoice.sql
│   │   ├── partial_payment.sql
│   │   ├── invoice.sql
│   │   └── purchase_detail.sql
│   ├── communication_loyalty/
│   │   ├── promotion.sql
│   │   ├── alert.sql
│   │   ├── terms_conditions.sql
│   │   └── customer_loyalty.sql
│   └── maintenance/
│       ├── room_maintenance.sql
│       ├── usage_maintenance.sql
│       ├── renovation_maintenance.sql
│       └── maintenance_dashboard.sql
│
├── dcl/
│   ├── roles/
│   │   └── create_roles.sql
│   └── grants/
│       ├── identity_security_grants.sql
│       ├── company_operations_grants.sql
│       ├── rooms_reservations_grants.sql
│       ├── inventory_services_grants.sql
│       ├── billing_payments_grants.sql
│       ├── communication_loyalty_grants.sql
│       └── maintenance_grants.sql
│
├── dml/
│   ├── seeds/
│   │   ├── identity_security/
│   │   ├── company_operations/
│   │   ├── rooms_reservations/
│   │   ├── inventory_services/
│   │   ├── billing_payments/
│   │   ├── communication_loyalty/
│   │   └── maintenance/
│   └── rollbacks/
│       └── (espejo de ddl/ con scripts DROP o UNDO)
│
└── tests/
    └── smoke/
        ├── identity_security/
        ├── company_operations/
        ├── rooms_reservations/
        ├── inventory_services/
        ├── billing_payments/
        ├── communication_loyalty/
        └── maintenance/
```

### Detalle de `docs/`

```
docs/
├── adr/
│   ├── 001-migracion-mysql-a-postgresql.md
│   ├── 002-uso-de-schemas-por-dominio.md
│   ├── 003-adopcion-uuid-como-identificador-universal.md
│   ├── 004-estructura-directorios-por-dominio.md
│   ├── 005-roles-y-permisos-dcl.md
│   └── 006-configuracion-entorno-docker-liquibase.md
└── domain/
    ├── 01_entendimiento_necesidad_producto.md
    ├── 02_posibles_funcionalidades_sistema.md
    ├── 03_estructura_modulo_entidad_sin_atributo.md
    ├── 04_estructura_modulo_entidad_con_atributo.md
    └── 05_id_y_auditoria.md
```

### Detalle de `docker/`

```
docker/
├── docker-compose.yml
├── .env.example
└── liquibase/
    └── liquibase.properties
```

---

## Convención de nombres de archivos SQL

Todos los archivos SQL usan snake_case en inglés. El nombre del archivo corresponde al nombre de la tabla en PostgreSQL (sin el prefijo del schema). Ejemplos:

| Tabla | Archivo |
|---|---|
| `identity_security.user` | `ddl/identity_security/user.sql` |
| `rooms_reservations.room_reservation` | `ddl/rooms_reservations/room_reservation.sql` |
| `billing_payments.invoice` | `ddl/billing_payments/invoice.sql` |

---

## Convención de changelogs de Liquibase

Cada changeSet referencia el script SQL de su dominio mediante `sqlFile`. El atributo `id` del changeSet sigue el patrón:

```
YYYY-MM-DD-NNN-dominio-nombre_tabla
```

Ejemplo:

```xml
<changeSet id="2026-05-06-001-identity_security-person" author="equipo">
    <sqlFile path="db/ddl/identity_security/person.sql" relativeToChangelogFile="false"/>
    <rollback>
        <sqlFile path="db/dml/rollbacks/identity_security/person_rollback.sql" relativeToChangelogFile="false"/>
    </rollback>
</changeSet>
```

---

## Consecuencias

### Positivas

- Cualquier persona del equipo puede localizar el script de una tabla específica sin ambigüedad.
- La estructura refleja directamente los dominios del modelo de negocio y los schemas de PostgreSQL.
- Liquibase puede ejecutar migraciones selectivas por dominio agrupando los changeSets correspondientes.
- Los rollbacks están ubicados como espejo de los scripts DDL, lo que facilita su mantenimiento.
- Los smoke tests y datos semilla siguen la misma convención de carpetas que los scripts de creación.
- Los ADRs tienen una ubicación estable y predecible en `docs/adr/`.

### Negativas

- La estructura jerárquica requiere que todos los colaboradores conozcan y respeten la convención.
- Agregar un nuevo dominio implica crear carpetas en múltiples categorías (`ddl/`, `dcl/`, `dml/`, `tests/`).
- Herramientas que asumen una estructura plana de scripts SQL pueden requerir configuración adicional.

---

## Criterios de aceptación

- La estructura de directorios descrita en este ADR existe en el repositorio.
- Cada tabla tiene su script DDL en la carpeta de dominio correspondiente.
- Cada script DDL tiene su rollback en `dml/rollbacks/` bajo el mismo dominio.
- Los changelogs de Liquibase referencian los scripts con la convención de `id` definida.
- Los ADRs residen en `docs/adr/` con numeración secuencial.
- La documentación de dominio reside en `docs/domain/`.

---

## Decisiones relacionadas

- ADR-001: Migración a PostgreSQL como motor relacional del proyecto.
- ADR-002: Uso de schemas por dominio en PostgreSQL.
- ADR-005: Roles y permisos de base de datos (DCL).
- ADR-006: Configuración de entorno con Docker y Liquibase.
