# Notas de migracion a PostgreSQL

## Resumen

El esquema original fue recibido como un script MySQL. Se convirtio a PostgreSQL y se reorganizo en scripts por dominio gestionados por Liquibase.

El archivo monolitico fue reemplazado por archivos individuales bajo `01_ddl/03_tables/<domain>`. Cada tabla tiene su rollback equivalente en `05_rollbacks/01_ddl/03_tables/<domain>`.

## Reglas importantes de conversion

| MySQL | PostgreSQL |
| --- | --- |
| `CREATE DATABASE IF NOT EXISTS` y `USE database_name` | Se manejan fuera del DDL, desde Docker, Liquibase o la conexion. |
| `SET FOREIGN_KEY_CHECKS` | No se usa. El orden lo controla Liquibase. |
| `BIGINT UNSIGNED NOT NULL AUTO_INCREMENT` | `UUID NOT NULL DEFAULT gen_random_uuid()` |
| `INT UNSIGNED` | `INTEGER` |
| `SMALLINT UNSIGNED` | `SMALLINT` |
| `TINYINT(1)` | `BOOLEAN` |
| `DATETIME` | `TIMESTAMP` |
| `ON UPDATE CURRENT_TIMESTAMP` | Funcion `set_updated_at()` y triggers por tabla. |
| `UNIQUE KEY` | Constraints `UNIQUE` con nombre. |
| `KEY` | Sentencias `CREATE INDEX`. |
| `ENGINE=InnoDB DEFAULT CHARSET...` | Se elimina por ser propio de MySQL. |

## Convencion de idioma

- Documentacion: espanol.
- Scripts SQL: ingles.
- Tablas y columnas: ingles.
- Constraints, indices y triggers: ingles.
- Carpetas de dominio tecnico: ingles.

## Estrategia de schemas

Las tablas se organizan fisicamente en PostgreSQL usando schemas por dominio. Para proteger el historial de Liquibase, no se reescriben los changeSets de tablas existentes. En su lugar:

1. `01_ddl/01_schemas` crea los schemas de dominio.
2. `01_ddl/03_tables` crea las tablas.
3. `01_ddl/10_schema_assignments` mueve las tablas desde `public` hacia su schema definitivo.

Esto permite que una base fresca funcione correctamente y tambien evita checksums rotos si una base ya tenia changeSets de tablas registrados.

## Activos actuales

- Tablas: `01_ddl/03_tables/<domain>/<sequence>-<table>.sql`
- Rollbacks de tablas: `05_rollbacks/01_ddl/03_tables/<domain>/<sequence>-<table>.rollback.sql`
- Funcion de auditoria: `01_ddl/06_functions/001_set_updated_at.sql`
- Triggers de auditoria: `01_ddl/08_triggers/001_updated_at_triggers.sql`
- Asignacion de tablas a schemas: `01_ddl/10_schema_assignments/001-assign-tables-to-domain-schemas.sql`
- Changelog maestro: `changelog/db.changelog-master.yaml`

## Validacion

Validacion sin base de datos real:

```powershell
liquibase --url=offline:postgresql validate
```

El siguiente paso es ejecutar Liquibase contra un contenedor PostgreSQL real cuando Docker Desktop este disponible.
