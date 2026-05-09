# ADR-004: Asignación de tablas a schemas de dominio

## Estado

Aceptada

## Fecha

2026-05-09

---

## Contexto

El proyecto ya definió el uso de schemas por dominio funcional en PostgreSQL, documentado en el ADR-002. Sin embargo, la creación inicial de tablas puede quedar concentrada en el schema `public` si los scripts de tablas no declaran explícitamente el schema destino o si se mantiene compatibilidad con changeSets ya existentes.

Modificar directamente los changeSets históricos de creación de tablas no es conveniente, porque Liquibase calcula checksums sobre los changeSets ejecutados. Cambiar scripts ya aplicados puede producir diferencias de checksum y bloquear nuevas ejecuciones sobre bases que ya tengan historial en `databasechangelog`.

Por esta razón se agregó la carpeta `01_ddl/10_schema_assignments/`, cuyo objetivo es mover las tablas existentes desde `public` hacia los schemas de dominio definidos para el sistema hotelero.

---

## Decisión

Se crea el paso DDL `01_ddl/10_schema_assignments/` para centralizar la asignación física de tablas a schemas de dominio.

El script principal es:

```text
01_ddl/10_schema_assignments/001-assign-tables-to-domain-schemas.sql
```

Este script usa sentencias `ALTER TABLE IF EXISTS public.<tabla> SET SCHEMA <schema>;` para mover las tablas desde `public` hacia su dominio correspondiente:

| Schema | Responsabilidad |
|---|---|
| `parameterization` | Clientes, precios, empresa, información legal, empleados y catálogos base |
| `distribution` | Sedes, habitaciones, tipos y estados de habitación |
| `service_delivery` | Reservas, disponibilidad, check-in, check-out, estadías y ventas de servicios |
| `billing` | Pre-facturas, pagos, facturas y detalles de compra |
| `inventory` | Productos, servicios, proveedores y disponibilidad de inventario |
| `notification` | Promociones, alertas, términos y fidelización |
| `security` | Personas, usuarios, roles, permisos, módulos y pantallas |
| `maintenance` | Mantenimiento de habitaciones, uso, remodelación y dashboard |

La carpeta se ubica al final de los pasos DDL numerados porque depende de que los schemas y las tablas ya existan. Su función no es crear entidades nuevas, sino reubicar tablas ya definidas dentro de la estructura de dominios.

---

## Consecuencias

### Positivas

- Se materializa la decisión del ADR-002: las tablas dejan de concentrarse en `public` y quedan organizadas por dominio funcional.
- Se evita modificar changeSets anteriores, reduciendo el riesgo de conflictos de checksum en Liquibase.
- La estructura física de PostgreSQL queda alineada con la arquitectura modular del sistema.
- Se habilita una base más clara para permisos por schema, consultas calificadas y administración por dominio.
- El cambio queda versionado y con rollback dentro del flujo de migraciones.

### Negativas

- Las consultas, constraints, datos semilla y scripts posteriores deben usar nombres calificados cuando crucen schemas.
- Cualquier script que asuma tablas en `public` debe ajustarse después de ejecutar este paso.
- El orden de ejecución se vuelve importante: `10_schema_assignments` debe correr después de crear schemas y tablas, y antes de scripts que dependan de las ubicaciones definitivas.
- Si una tabla no existe, `IF EXISTS` evita que falle la sentencia, pero también puede ocultar una omisión que deba revisarse en validaciones posteriores.

---

## Reglas de uso

- Los scripts de `10_schema_assignments` deben limitarse a mover objetos existentes hacia su schema definitivo.
- No deben crear tablas, constraints, índices, datos semilla ni permisos.
- Toda nueva tabla debe tener definido su schema de dominio esperado.
- Si una tabla se crea inicialmente en `public` por compatibilidad con migraciones existentes, su reubicación debe agregarse en esta carpeta.
- Los rollbacks deben devolver las tablas a `public` solo cuando sea necesario para revertir el cambio de asignación.

---

## Decisiones relacionadas

- ADR-001: Migración de MySQL a PostgreSQL.
- ADR-002: Uso de schemas por módulo funcional en PostgreSQL.
- ADR-003: Adopción de UUID como identificador universal de todas las tablas.
