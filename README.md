# Hotel-system-6

Workspace de migracion de base de datos para el sistema hotelero.

El motor objetivo actual es PostgreSQL 16, gestionado con Liquibase y Docker Compose. La documentacion se mantiene en espanol, mientras que los scripts SQL y el contrato de base de datos se mantienen en ingles.

## Documentacion principal

- `docs/analisis_dominios.md`
- `docs/funcionalidades_sistema.md`
- `docs/notas_migracion_postgresql.md`
- `docs/plan_trabajo_inicial.md`
- `docs/plan_datos_prueba.md`
- `docs/backlog_tecnico.md`
- `docs/seguimientos.md`
- `adr/001-migracion-mysql-a-postgresql.md`
- `adr/002-uso-de-schemas-por-dominio.md`

## Validacion

Validar el changelog de Liquibase sin una base de datos real:

```powershell
liquibase --url=offline:postgresql validate
```

Aplicar el changelog con Docker cuando Docker Desktop este ejecutandose:

```powershell
docker compose up --build
```
