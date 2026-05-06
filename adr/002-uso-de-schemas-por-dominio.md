# ADR-002: Uso de schemas por modulo funcional en PostgreSQL

## Estado

Aceptada

## Fecha

2026-05-05

## Contexto

El esquema del sistema hotelero contiene 8 modulos funcionales: parametrizacion, distribucion, prestacion de servicio, facturacion, inventario, notificacion, seguridad y mantenimiento.

Inicialmente las tablas se crean desde scripts organizados por carpetas de dominio. Sin embargo, si todas las tablas quedan en `public`, la base de datos pierde parte de esa separacion logica cuando se consulta directamente desde PostgreSQL.

Tambien existe una consideracion importante con Liquibase: si una base ya ejecuto changeSets anteriores, editar directamente esos changeSets puede generar diferencias de checksum. Por eso la asignacion de tablas a schemas se implementa como nuevos changeSets aditivos.

## Decision

Se usaran schemas PostgreSQL por modulo funcional:

- `parameterization`
- `distribution`
- `service_delivery`
- `billing`
- `inventory`
- `notification`
- `security`
- `maintenance`

Los schemas se crean en `01_ddl/01_schemas`.

Las tablas se mueven desde `public` hacia su schema de dominio mediante un changeSet nuevo en `01_ddl/10_schema_assignments`. Esta decision evita reescribir los changeSets existentes de tablas y reduce el riesgo de conflictos con Liquibase en bases donde ya exista historial en `databasechangelog`.

## Consecuencias

### Positivas

- El modelo queda separado por modulos funcionales dentro de PostgreSQL.
- Se habilita una futura estrategia de permisos por schema.
- Las consultas y herramientas de administracion muestran una estructura mas clara.
- Se evita editar changeSets de tablas que podrian estar registrados en una base existente.

### Negativas

- Las consultas nuevas deben usar nombres calificados, por ejemplo `distribution.room`, `service_delivery.room_reservation` o `billing.invoice`.
- El `search_path` debe configurarse con cuidado si una aplicacion consulta sin schema.
- Los datos semilla y smoke tests deben usar los schemas correctos.

## Criterios de aceptacion

- Los 8 schemas funcionales existen.
- Las 46 tablas quedan asignadas a su schema correspondiente.
- Liquibase valida el changelog sin errores.
- La documentacion explica el motivo de la separacion por schemas.
