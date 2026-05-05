<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?color=1E90FF&size=50&center=true&vCenter=true&width=900&font=Audiowide&lines=SISTEMA+HOTELERO;HOTEL+MANAGEMENT+SYSTEM;Gestión+de+Hoteles+Moderna" />
</p>


# Contexto General del Proyecto — Sistema de Gestión Hotelera

## 1. Descripción del proyecto

El proyecto consiste en el diseño, planificación y construcción de la base de datos de un sistema de gestión hotelera. El equipo trabaja bajo la metodología ágil Scrum, gestionando las tareas a través de Trello y documentando las decisiones técnicas en un repositorio de GitHub. La infraestructura y los entornos se gestionan con soporte en Azure.

El objetivo principal del sprint (06-05 al 12-05) es entregar un repositorio funcional con la base de datos completamente estructurada, documentada y validada, lista para sustentar ante el equipo evaluador.

---

## 2. Objetivo general

Diseñar e implementar la base de datos relacional de un sistema hotelero usando PostgreSQL, organizar el repositorio con buenas prácticas de desarrollo colaborativo, y documentar cada decisión técnica mediante historias de usuario, criterios DoR/DoD y un tablero de responsabilidades.

---

## 3. Herramientas utilizadas

| Herramienta | Uso |
|---|---|
| GitHub | Repositorio del proyecto con ramas main, qa y develop |
| Trello | Tablero de gestión de tareas y seguimiento del sprint |
| PostgreSQL | Motor de base de datos relacional del sistema |
| draw.io / dbdiagram | Diseño del modelo entidad-relación (MER) |
| Docker | Contenerización del entorno de base de datos |

---


**Ramas configuradas:**
- `main` → Código estable y aprobado
- `qa` → Versión en revisión y pruebas
- `develop` → Rama de desarrollo activo

---

## 6. Historias de usuario — Definición DoR y DoD

### ¿Qué es DoR (Definition of Ready)?
Condiciones mínimas que debe cumplir una HU antes de poder comenzar a trabajar en ella.

### ¿Qué es DoD (Definition of Done)?
Condiciones que debe cumplir una HU para considerarse completamente terminada.

---

## 7. Historias de usuario priorizadas

### Fase 1 — Planificación y setup · 06-05

**HU-04 · Alta · 3SP · SM — Estructuración del repositorio**
Crear la estructura base del repositorio en GitHub con carpetas /database, /doc y /adr, README inicial, y ramas main, qa y develop configuradas para el trabajo colaborativo del equipo.
- DoR: Cuenta GitHub disponible, equipo con acceso
- DoD: Repo creado, carpetas y ramas activas, README redactado

**HU-14 · Alta · 1SP · SM — Backlog técnico**
Documentar todas las HUs del proyecto con prioridad, story points y responsable en el archivo backlog_tecnico.md guardado en /doc.
- DoR: Todas las HUs definidas
- DoD: backlog_tecnico.md con ID, descripción, prioridad, SP y responsable

**HU-16 · Alta · 1SP · SM — Plan de trabajo inicial**
Documentar el plan del sprint con fechas (06-05 al 12-05), actividades por día, responsables y entregables esperados en plan_trabajo_inicial.md.
- DoR: Fechas del sprint confirmadas
- DoD: Archivo en /doc con actividades diarias asignadas por persona

**HU-02 · Alta · 2SP · Laura — Análisis de dominios**
Documentar los módulos del sistema hotelero (reservas, habitaciones, usuarios, pagos) y sus relaciones en el archivo analisis_dominios.md guardado en /doc.
- DoR: Módulos identificados, herramienta de documentación lista
- DoD: analisis_dominios.md con módulos y relaciones descritos

**HU-03 · Alta · 2SP · Daniel — ADR PostgreSQL vs MySQL**
Justificar técnicamente la decisión de usar PostgreSQL mediante un documento ADR que incluya contexto, decisión tomada y consecuencias, guardado en /adr.
- DoR: Decisión técnica tomada, contexto claro
- DoD: adr_postgresql.md en /adr con contexto, decisión y consecuencias

---

### Fase 2 — Entorno y diseño · 07-05

**HU-05 · Alta · 3SP · Kevin — Configuración del entorno**
Configurar PostgreSQL (local o con Docker), verificar la conexión y configurar las variables de entorno en un archivo .env.
- DoR: Docker o PostgreSQL local disponible
- DoD: BD corriendo, conexión verificada, .env configurado

**HU-06 · Alta · 5SP · Kevin — Diseño de base de datos (MER)**
Diseñar el modelo entidad-relación del sistema hotelero con todas las entidades, atributos, relaciones y cardinalidades, normalizado hasta 3FN, exportado en /doc.
- DoR: HU-02 completada, herramienta de diagramas disponible
- DoD: MER completo, normalizado hasta 3FN, exportado a /doc

**HU-15 · Media · 2SP · Laura — Plan de datos de prueba**
Definir los datos de prueba del sistema (usuarios, habitaciones, reservas) en el archivo plan_datos_prueba.md para validar la base de datos antes de ejecutar los scripts.
- DoR: HU-06 completada
- DoD: plan_datos_prueba.md con datos coherentes y relaciones verificadas

---

### Fase 3 — Construcción de la BD · 08-05 al 09-05

**HU-09 · Alta · 2SP · Kevin — Usuario BD ariel5253**
Crear el usuario de base de datos ariel5253 con contraseña ariel5253, otorgando permisos DDL y DML pero sin permisos DCL (no puede hacer GRANT ni REVOKE).
- DoR: PostgreSQL corriendo con acceso admin
- DoD: Usuario creado, permisos DDL y DML otorgados, DCL denegado verificado

**HU-10 · Alta · 2SP · Kevin — Autenticación con ariel5253**
Validar que el usuario ariel5253 puede conectarse a la base de datos, ejecutar operaciones DDL y DML correctamente, y que el sistema rechaza cualquier intento de operación DCL.
- DoR: HU-09 completada
- DoD: Conexión funcional, DDL y DML verificados, DCL rechazado documentado

**HU-07 · Alta · 5SP · Daniel — Scripts DDL**
Crear el script ddl.sql con los CREATE TABLE de todas las entidades del sistema, incluyendo PRIMARY KEY, FOREIGN KEY y tipos de datos correctos, guardado en /database.
- DoR: HU-06 aprobada, PostgreSQL disponible
- DoD: ddl.sql ejecuta sin errores, todas las tablas y relaciones correctas

**HU-08 · Alta · 3SP · Daniel — Scripts DML**
Crear el script dml.sql con INSERT de datos de prueba coherentes en todas las tablas, respetando las relaciones entre ellas, guardado en /database.
- DoR: HU-07 ejecutada correctamente
- DoD: dml.sql con mínimo 5 registros por tabla, validado con SELECT

**HU-11 · Alta · 3SP · Daniel — Gestión de habitaciones**
Implementar a nivel de base de datos las operaciones INSERT, UPDATE, DELETE y SELECT sobre la tabla habitaciones, probadas con el usuario ariel5253.
- DoR: HU-07 y HU-08 completadas
- DoD: Las cuatro operaciones funcionan correctamente sobre la tabla habitaciones

---

### Fase 4 — Validación y consultas · 10-05 al 12-05

**HU-12 · Media · 5SP · Daniel — Registro de reservas**
Implementar la inserción de reservas en la base de datos asociando correctamente cliente y habitación mediante FK, con validación de disponibilidad mediante consulta previa.
- DoR: HU-11 completada, datos en BD
- DoD: INSERT de reservas funcional, validación de disponibilidad implementada

**HU-13 · Media · 3SP · Daniel — Consultas SELECT**
Escribir las consultas principales del sistema: listado de usuarios, habitaciones disponibles, reservas con JOIN a clientes y habitaciones, y pagos por reserva, guardadas en /database/queries.sql.
- DoR: HU-08 completada, datos en BD
- DoD: queries.sql con todas las consultas funcionales y resultados correctos

**HU-17 · Media · 1SP · SM — Seguimiento del proyecto**
Registrar el avance diario del sprint en seguimientos.md, identificando bloqueos y actualizando el estado de cada HU durante todo el sprint (06-05 al 12-05).
- DoR: Sprint iniciado, tablero activo
- DoD: seguimientos.md con registro diario completo hasta el cierre del sprint

---

## 8. Resumen de estimación — Planning

| Integrante | HUs asignadas | Story Points |
|---|---|---|
| Kevin | HU-05, HU-06, HU-09, HU-10 | 12 SP |
| Daniel | HU-03, HU-07, HU-08, HU-11, HU-12, HU-13 | 21 SP |
| Laura | HU-02, HU-15 | 4 SP |
| Scrum Master | HU-04, HU-14, HU-16, HU-17 | 6 SP |
| **Total** | **16 HUs** | **43 SP** |

---

## 9. Tablero de responsabilidades (Trello)

El tablero en Trello está organizado con las siguientes columnas:

- **Por hacer** → HUs priorizadas pendientes de iniciar
- **En progreso** → HUs actualmente en desarrollo
- **En revisión** → HUs completadas pendientes de validación
- **Listo** → HUs que cumplen todos los criterios DoD

Cada tarjeta en Trello contiene: ID de HU, descripción, responsable asignado, checklist de tareas, criterios DoR y DoD, story points y fecha límite.

---

## 10. Notas para la sustentación

- El usuario `ariel5253` debe poder autenticarse y ejecutar operaciones DDL y DML, pero no DCL. Esto se demuestra en la HU-09 y HU-10.
- La decisión técnica de PostgreSQL sobre MySQL está documentada en el ADR (HU-03).
- Toda la documentación del sprint (backlog, plan de trabajo, seguimientos, análisis de dominios) se encuentra en la carpeta /doc del repositorio.
- El MER normalizado hasta 3FN se encuentra en /doc y respalda el diseño de los scripts DDL.
- Los scripts DDL y DML están en /database y son ejecutables directamente sobre la instancia PostgreSQL configurada.

____________________________

## Presentacion 

https://canva.link/a5ze84n54wcti68

## Trellor 

https://trello.com/invite/b/69fa077e34942289367cd69e/ATTI6a306cfb59abd9d73486928273022543089EE559/hotelera

