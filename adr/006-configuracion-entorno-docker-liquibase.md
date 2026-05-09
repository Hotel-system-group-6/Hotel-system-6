# ADR-006: Configuración de entorno de trabajo con Docker y Liquibase

## Estado

Aceptada

## Fecha

2026-05-06

---

## Contexto

El proyecto requiere un entorno de desarrollo local reproducible y alineado con las decisiones de infraestructura adoptadas en los ADRs anteriores:

- PostgreSQL 16 como motor de base de datos (ADR-001).
- 7 schemas de dominio funcional (ADR-002).
- UUID v4 como identificador universal (ADR-003).
- Estructura de directorios organizada por dominio (ADR-004).
- Roles y permisos DCL con 4 usuarios diferenciados (ADR-005).

Sin una configuración de entorno estandarizada, cada desarrollador levanta la base de datos de forma distinta, usa credenciales distintas, aplica migraciones en orden diferente y no puede garantizar que su entorno local refleje el estado real del modelo. Esto genera inconsistencias difíciles de depurar y bloquea la colaboración en el equipo.

Liquibase necesita conectarse a PostgreSQL con un usuario que tenga privilegios DDL completos (`liquibase_user` con rol `hotel_admin`). Docker Compose debe levantar PostgreSQL con los parámetros correctos y dejar la base lista para que Liquibase aplique los changelogs desde el primer `docker compose up`.

---

## Decisión

Se usa **Docker Compose** para levantar el entorno local y **Liquibase** para gestionar todas las migraciones y rollbacks. La configuración sensible (contraseñas, nombres de base de datos) se inyecta mediante un archivo `.env` que nunca se sube al repositorio.

---

## Estructura de archivos de configuración

```
project-root/
├── docker/
│   ├── docker-compose.yml
│   ├── .env.example
│   └── liquibase/
│       ├── liquibase.properties
│       └── wait-for-postgres.sh
├── db/
│   └── changelog/
│       ├── db.changelog-master.xml
│       └── releases/
│           └── YYYY-MM-DD/
│               └── db.changelog-YYYY-MM-DD.xml
└── .gitignore
```

> El archivo `.env` real nunca se incluye en el repositorio. Solo se versiona `.env.example` con los nombres de las variables y valores de ejemplo.

---

## Archivo `.env.example`

```dotenv
# PostgreSQL
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=hotel_db
POSTGRES_USER=postgres
POSTGRES_PASSWORD=change_me

# Liquibase (usa liquibase_user con rol hotel_admin)
LIQUIBASE_URL=jdbc:postgresql://localhost:5432/hotel_db
LIQUIBASE_USERNAME=liquibase_user
LIQUIBASE_PASSWORD=change_me

# Usuarios de aplicación (creados por DCL, ver ADR-005)
APP_USER=app_user
APP_USER_PASSWORD=change_me

READONLY_USER=readonly_user
READONLY_USER_PASSWORD=change_me

MAINTENANCE_USER=maintenance_user
MAINTENANCE_USER_PASSWORD=change_me
```

---

## Archivo `docker-compose.yml`

```yaml
version: "3.9"

services:

  postgres:
    image: postgres:16
    container_name: hotel_postgres
    restart: unless-stopped
    environment:
      POSTGRES_DB: ${POSTGRES_DB}
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    ports:
      - "${POSTGRES_PORT}:5432"
    volumes:
      - hotel_postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB}"]
      interval: 5s
      timeout: 5s
      retries: 10

  liquibase:
    image: liquibase/liquibase:4.27
    container_name: hotel_liquibase
    depends_on:
      postgres:
        condition: service_healthy
    environment:
      LIQUIBASE_COMMAND_URL: ${LIQUIBASE_URL}
      LIQUIBASE_COMMAND_USERNAME: ${LIQUIBASE_USERNAME}
      LIQUIBASE_COMMAND_PASSWORD: ${LIQUIBASE_PASSWORD}
      LIQUIBASE_COMMAND_CHANGELOG_FILE: db/changelog/db.changelog-master.xml
    volumes:
      - ../db:/liquibase/db
    command: update

volumes:
  hotel_postgres_data:
```

> El servicio `liquibase` depende del healthcheck de `postgres`. No se inicia hasta que PostgreSQL responda correctamente. Esto evita errores de conexión por orden de arranque.

---

## Archivo `liquibase.properties`

Este archivo se usa cuando Liquibase se ejecuta de forma local fuera de Docker (por ejemplo, desde CLI o desde el IDE):

```properties
url=${LIQUIBASE_URL}
username=${LIQUIBASE_USERNAME}
password=${LIQUIBASE_PASSWORD}
changeLogFile=db/changelog/db.changelog-master.xml
liquibase.hub.mode=off
```

Las variables se resuelven desde el entorno del sistema operativo o desde el archivo `.env` cargado manualmente.

---

## Estructura del changelog master

El changelog master incluye los changelogs de cada release en orden cronológico. Cada release agrupa los changeSets de ese ciclo de trabajo:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<databaseChangeLog
    xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
        http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-4.27.xsd">

    <!-- Schemas de dominio -->
    <include file="db/ddl/common/schemas/create_schemas.sql"
             relativeToChangelogFile="false"/>

    <!-- DDL por dominio -->
    <include file="db/changelog/releases/2026-05-06/db.changelog-2026-05-06.xml"
             relativeToChangelogFile="false"/>

    <!-- Asignación de tablas a schemas -->
    <include file="db/ddl/common/schema_assignments/assign_tables_to_schemas.sql"
             relativeToChangelogFile="false"/>

    <!-- DCL: roles, usuarios y grants -->
    <include file="db/changelog/releases/2026-05-06/db.changelog-dcl-2026-05-06.xml"
             relativeToChangelogFile="false"/>

</databaseChangeLog>
```

---

## Convención de changeSets

Cada changeSet sigue el patrón definido en ADR-004:

```xml
<changeSet id="2026-05-06-001-identity_security-person" author="equipo">
    <sqlFile path="db/ddl/identity_security/person.sql"
             relativeToChangelogFile="false"
             splitStatements="true"
             stripComments="true"/>
    <rollback>
        <sqlFile path="db/dml/rollbacks/identity_security/person_rollback.sql"
                 relativeToChangelogFile="false"/>
    </rollback>
</changeSet>
```

Reglas obligatorias para los changeSets:

- El atributo `id` es único e inmutable. Una vez ejecutado, no se modifica.
- Cada changeSet cubre exactamente una tabla o una operación DCL.
- Todo changeSet tiene un bloque `<rollback>` definido.
- Los changeSets DDL se ejecutan antes que los changeSets DCL.
- Los changeSets de asignación de schemas (`schema_assignments`) se ejecutan después de los DDL de tablas y antes de los DCL.

---

## Flujo de trabajo local

### Primer arranque

```bash
# 1. Copiar variables de entorno
cp docker/.env.example docker/.env

# 2. Editar docker/.env con las credenciales locales

# 3. Levantar PostgreSQL y aplicar todas las migraciones
docker compose -f docker/docker-compose.yml up -d

# 4. Verificar que Liquibase aplicó todos los changeSets
docker logs hotel_liquibase
```

### Aplicar nuevas migraciones

```bash
# Liquibase detecta los changeSets nuevos y los aplica
docker compose -f docker/docker-compose.yml run --rm liquibase update
```

### Ejecutar rollback de los últimos N changeSets

```bash
docker compose -f docker/docker-compose.yml run --rm liquibase \
  rollback-count --count=3
```

### Verificar estado del changelog

```bash
docker compose -f docker/docker-compose.yml run --rm liquibase status
```

### Detener el entorno

```bash
docker compose -f docker/docker-compose.yml down
```

### Destruir el entorno y los datos

```bash
docker compose -f docker/docker-compose.yml down -v
```

---

## Archivo `.gitignore` recomendado

```gitignore
# Variables de entorno con credenciales
docker/.env

# Archivos de sistema
.DS_Store
Thumbs.db

# Logs de Liquibase
*.log

# Directorios de IDEs
.idea/
.vscode/
*.iml
```

---

## Consecuencias

### Positivas

- Cualquier miembro del equipo puede levantar el entorno completo con tres comandos: copiar `.env`, editar credenciales y ejecutar `docker compose up`.
- El healthcheck de PostgreSQL garantiza que Liquibase no intente conectarse antes de que el motor esté listo.
- Las credenciales nunca se versionan en el repositorio gracias al `.env` en `.gitignore`.
- Los rollbacks están definidos por tabla, lo que permite revertir cambios de forma selectiva sin destruir el entorno.
- La imagen oficial `postgres:16` garantiza reproducibilidad entre entornos locales.
- Liquibase registra cada changeSet en `databasechangelog`, lo que permite auditar exactamente qué cambios se han aplicado y en qué orden.

### Negativas

- Docker debe estar instalado en la máquina de cada desarrollador. No funciona sin Docker Engine activo.
- El volumen `hotel_postgres_data` persiste entre reinicios. Para empezar desde cero es necesario ejecutar `docker compose down -v`, lo que destruye todos los datos locales.
- Liquibase bloquea la edición de changeSets ya ejecutados. Cualquier corrección debe implementarse como un nuevo changeSet, no como una modificación del existente.
- La imagen `liquibase/liquibase:4.27` incluye el driver JDBC de PostgreSQL, pero si se cambia de versión debe verificarse la compatibilidad del driver.

---

## Criterios de aceptación

- `docker compose up` levanta PostgreSQL 16 y aplica todos los changelogs de Liquibase sin errores.
- Las 46 tablas existen en la base de datos con sus schemas correctos después del primer arranque.
- Los 4 usuarios de base de datos existen con sus roles asignados (ADR-005).
- El archivo `.env` no está en el repositorio. Solo existe `.env.example`.
- Todos los changeSets tienen `<rollback>` definido.
- `docker compose down -v` destruye el entorno limpiamente sin errores.
- El comando `liquibase status` no reporta changeSets pendientes después de `docker compose up`.

---

## Decisiones relacionadas

- ADR-001: Migración a PostgreSQL como motor relacional del proyecto.
- ADR-002: Uso de schemas por dominio en PostgreSQL.
- ADR-003: Adopción de UUID v4 como identificador universal de todas las tablas.
- ADR-004: Estructura de directorios del proyecto organizada por dominio.
- ADR-005: Roles y permisos de base de datos (DCL).
