# Plan de trabajo inicial

## Objetivo

Migrar el esquema del sistema hotelero desde MySQL hacia PostgreSQL, manteniendo la documentacion relevante en espanol y los scripts SQL en ingles.

## Trabajo completado

1. Conversion del DDL MySQL a sintaxis PostgreSQL.
2. Eliminacion de comandos y opciones propias de MySQL.
3. Separacion del esquema en un archivo SQL por tabla.
4. Agrupacion de tablas por dominio tecnico.
5. Traduccion del contrato SQL a ingles: tablas, columnas, constraints, indices, triggers y archivos.
6. Registro de los scripts en Liquibase.
7. Creacion de rollbacks por tabla.
8. Creacion de funcion y triggers para mantener `updated_at`.
9. Creacion de schemas PostgreSQL por dominio.
10. Asignacion de tablas a sus schemas sin reescribir changeSets existentes.
11. Validacion offline de Liquibase.

## Siguiente trabajo

1. Levantar Docker Desktop y aplicar el changelog contra PostgreSQL real.
2. Crear datos semilla en `02_dml`.
3. Convertir el smoke test original a PostgreSQL y a nombres SQL en ingles.
4. Validar conteo de tablas, columnas de auditoria, datos base y joins principales.
5. Revisar si se requieren `CHECK` adicionales para valores que antes eran `UNSIGNED`.
