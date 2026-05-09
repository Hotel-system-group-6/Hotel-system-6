# Documentacion del rol instructor

## Alcance

Actualmente, en los scripts DCL del proyecto se administra el rol tecnico de PostgreSQL `role_instructor` y el usuario login `ariel5253` que hereda dicho rol.

Este rol se usa para agrupar permisos de acceso sobre la base de datos `hotel_system` y sobre los schemas principales del sistema hotelero.

## Rol y usuario existentes

| Nombre | Tipo | Descripcion |
| --- | --- | --- |
| `role_instructor` | `NOLOGIN` | Rol tecnico agrupador de permisos. No permite iniciar sesion directamente. |
| `ariel5253` | `LOGIN INHERIT` | Usuario de base de datos que puede iniciar sesion y hereda los permisos de `role_instructor`. |

## Credenciales del usuario

| Usuario | Contrasena | Rol heredado |
| --- | --- | --- |
| `ariel5253` | `ariel5253` | `role_instructor` |

El bloque actual crea el rol instructor, crea el usuario login y asigna el rol al usuario:

```sql
CREATE ROLE role_instructor NOLOGIN;
CREATE ROLE ariel5253 LOGIN INHERIT PASSWORD 'ariel5253';
GRANT role_instructor TO ariel5253;
```

## Permisos asignados

El rol `role_instructor` recibe permisos mediante el script `03_dcl/01_grants/001-grant-permissions-instructor.sql`.

### Base de datos

| Base de datos | Permisos |
| --- | --- |
| `hotel_system` | `CONNECT`, `TEMPORARY` |

### Schema public

| Objeto | Permiso |
| --- | --- |
| Schema `public` | `USAGE` |
| Funcion `public.set_updated_at()` | `EXECUTE` |

### Schemas del sistema

El rol tiene permiso `USAGE` sobre los siguientes schemas:

| Schema |
| --- |
| `parameterization` |
| `distribution` |
| `service_delivery` |
| `billing` |
| `inventory` |
| `notification` |
| `security` |
| `maintenance` |

### Tablas actuales

Sobre todas las tablas existentes en los schemas del sistema, el rol tiene:

| Permiso |
| --- |
| `SELECT` |
| `INSERT` |
| `UPDATE` |
| `DELETE` |

### Secuencias actuales

Sobre todas las secuencias existentes en los schemas del sistema, el rol tiene:

| Permiso |
| --- |
| `USAGE` |
| `SELECT` |
| `UPDATE` |

## Permisos por defecto

El script tambien define permisos por defecto para objetos futuros dentro de los schemas del sistema.

Para tablas futuras:

| Permiso |
| --- |
| `SELECT` |
| `INSERT` |
| `UPDATE` |
| `DELETE` |

Para secuencias futuras:

| Permiso |
| --- |
| `USAGE` |
| `SELECT` |
| `UPDATE` |

## Rollback

El rollback del rol se encuentra en:

```text
05_rollbacks/03_dcl/00_roles/001-create-role-instructor-rollback.sql
```

Actualmente revoca la asignacion del rol, elimina el usuario login y luego elimina el rol instructor:

```sql
REVOKE role_instructor FROM ariel5253;
DROP ROLE IF EXISTS ariel5253;
DROP ROLE IF EXISTS role_instructor;
```

## Archivos relacionados

- `03_dcl/00_roles/001-create-role-instructor.sql`
- `03_dcl/01_grants/001-grant-permissions-instructor.sql`
- `05_rollbacks/03_dcl/00_roles/001-create-role-instructor-rollback.sql`
- `05_rollbacks/03_dcl/01_grants/001-grant-permissions-instructor-rollback.sql`
