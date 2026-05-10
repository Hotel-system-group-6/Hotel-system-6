| Operación    | Tipo | Comando                                        | Resultado obtenido                          | Estado |
|---|---|---|---|---|
| Conexión     | —    | psql -U ariel5253 -d hotel_system              | Conexión exitosa                            | ✅ OK  |
| SELECT       | DML  | SELECT * FROM security.person LIMIT 5          | Retornó 5 registros correctamente           | ✅ OK  |
| INSERT       | DML  | INSERT INTO parameterization.customer (...)    | INSERT 1 — registro creado correctamente    | ✅ OK  |
| UPDATE       | DML  | UPDATE parameterization.customer SET email ... | UPDATE 1 — registro actualizado             | ✅ OK  |
| DELETE       | DML  | DELETE FROM parameterization.customer ...      | DELETE 1 — registro eliminado               | ✅ OK  |
| CREATE TABLE | DDL  | CREATE TABLE public.prueba_ddl (id INT)        | ERROR: permission denied for schema public  | ✅ Rechazado |
| GRANT        | DCL  | GRANT SELECT ON ALL TABLES IN SCHEMA security  | WARNING: no privileges were granted         | ✅ Rechazado |

______________________________________________


> - Conexión exitosa con ariel5253 / ariel5253
> - DML funciona correctamente (SELECT, INSERT, UPDATE, DELETE)
> - DDL es rechazado
> - DCL no tiene efecto real