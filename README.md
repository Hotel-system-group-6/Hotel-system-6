<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?color=1E90FF&size=50&center=true&vCenter=true&width=900&font=Audiowide&lines=SISTEMA+HOTELERO;HOTEL+MANAGEMENT+SYSTEM;Gestión+de+Hoteles+Moderna" />
</p>

## 1. Descripción del proyecto

El proyecto consiste en el diseño, planificación y construcción de la base de datos de un sistema de gestión hotelera. El equipo trabaja bajo la metodología ágil Scrum, gestionando las tareas a través de Trello y documentando las decisiones técnicas en un repositorio de GitHub. La infraestructura y los entornos se gestionan con soporte en trellor.


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

Fase, es la etapa que se esta cumpliendo dentro del proceso

FaseFechasHUsSPMoSCoWFase 1 — Planificación y setup06-05HU-04, HU-20, HU-21, HU-02, HU-039 SPMust haveFase 2 — Entorno y diseño07-05HU-05, HU-01, HU-0610 SPMust haveFase 3 — Construcción de la BD08-05 al 09-05HU-08, HU-09, HU-07, HU-10, HU-11, HU-12, HU-13, HU-14, HU-1536 SPMust / ShouldFase 4 — Datos y validación10-05 al 11-05HU-17, HU-188 SPMust haveFase 5 — Integridad y cierre12-05HU-19, HU-16, HU-228 SPMust / CouldTotal06-05 al 12-0522 HUs71 SP

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

