# Seguimientos

## 2026-05-05

- Se creo el ADR de migracion de MySQL a PostgreSQL.
- Se convirtio el esquema MySQL a sintaxis PostgreSQL.
- Se separo el esquema en un archivo SQL por tabla.
- Se agruparon las tablas por dominio tecnico.
- Se tradujeron los scripts SQL a ingles: archivos, tablas, columnas, constraints, indices y triggers.
- Se agregaron rollbacks por tabla.
- Se agrego `set_updated_at()` y triggers por tabla para reemplazar `ON UPDATE CURRENT_TIMESTAMP`.
- Se agregaron schemas PostgreSQL por dominio.
- Se agrego una migracion aditiva para mover tablas desde `public` a sus schemas sin reescribir changeSets previos.
- Se actualizo la configuracion de Liquibase y entorno local.
- Se valido el changelog con `liquibase --url=offline:postgresql validate`.

## Pendiente

- Ejecutar el changelog contra PostgreSQL real cuando Docker Desktop este disponible.
- Convertir el smoke test a PostgreSQL con nombres SQL en ingles.
- Crear datos semilla y validar flujos principales.
