# Plan de Trabajo Inicial — Sprint
## Sistema de Gestión Hotelera · 06-05-2026 al 12-05-2026

---

## Equipo

| Integrante | Rol |
|---|---|
| Kevin | DBA / Entorno |
| Daniel | Desarrollador SQL |
| Laura | Documentación / QA |
| Maria | Scrum Master |

---

## Día 1 — Miércoles 06-05-2026
### Fase 1 — Planificación y setup

| HU | Actividad | Responsable | Entregable |
|---|---|---|---|
| HU-04 | Crear repositorio en GitHub, carpetas y ramas main/qa/develop | Maria | Repo funcional con estructura base |
| HU-20 | Documentar backlog técnico con HUs, prioridad y SP | Todo el equipo | `/doc/backlog_tecnico.md` |
| HU-21 | Documentar plan de trabajo del sprint | Maria | `/doc/plan_trabajo_inicial.md` |
| HU-02 | Identificar módulos del sistema y relaciones entre dominios | Daniel | `/doc/analisis_dominios.md` |
| HU-03 | Redactar ADR justificando PostgreSQL sobre MySQL | Kevin | `/adr/adr_postgresql.md` |

---

## Día 2 — Jueves 07-05-2026
### Fase 2 — Entorno y diseño

| HU | Actividad | Responsable | Entregable |
|---|---|---|---|
| HU-05 | Instalar PostgreSQL, configurar `.env` y verificar conexión | Daniel | BD corriendo, `.env` configurado |
| HU-01 | Definir estructura de auditoría y validar `gen_random_uuid()` | Kevin | Convención documentada en `/doc` |
| HU-06 | Diseñar modelo entidad-relación normalizado hasta 3FN | Laura + Daniel | MER exportado en `/doc` |

---

## Día 3 — Viernes 08-05-2026
### Fase 3 — Construcción de la BD (parte 1)

| HU | Actividad | Responsable | Entregable |
|---|---|---|---|
| HU-08 | Crear usuario `ariel5253` con permisos DDL y DML, sin DCL | Kevin | Usuario creado y documentado |
| HU-09 | Validar autenticación y pruebas de permisos del usuario | Kevin | Resultado documentado en `/doc` |
| HU-07 | Crear tablas del módulo de seguridad | Daniel | Tablas `person`, `system_user`, `role`, `permission`, etc. |
| HU-10 | Crear tablas del módulo de parametrización | Daniel | Tablas `customer`, `company`, `employee`, `payment_method`, etc. |

---

## Día 4 — Sábado 09-05-2026
### Fase 3 — Construcción de la BD (parte 2)

| HU | Actividad | Responsable | Entregable |
|---|---|---|---|
| HU-11 | Crear tablas del módulo de distribución | Daniel | Tablas `branch`, `room`, `room_type`, `room_status` |
| HU-12 | Crear tablas del módulo de prestación de servicio | Daniel | Tablas `room_reservation`, `stay`, `check_in`, `check_out`, etc. |
| HU-13 | Crear tablas del módulo de facturación | Daniel | Tablas `invoice`, `pre_invoice`, `partial_payment`, `purchase_detail` |
| HU-14 | Crear tablas del módulo de inventario | Kevin | Tablas `product`, `service`, `supplier`, `product_tracking` |
| HU-15 | Crear tablas del módulo de mantenimiento | Kevin | Tablas `room_maintenance`, `usage_maintenance`, etc. |

---

## Día 5 — Lunes 11-05-2026
### Fase 4 — Datos y validación

| HU | Actividad | Responsable | Entregable |
|---|---|---|---|
| HU-17 | Crear stored procedures e insertar datos canónicos | Daniel | `/database/dml_canonical.sql` |
| HU-18 | Crear stored procedures e insertar datos volumétricos | Daniel | `/database/dml_volumetric.sql` |
| — | Revisión general de integridad referencial y datos huérfanos | Kevin + Laura | Sin errores en BD |

---

## Día 6 — Martes 12-05-2026
### Fase 5 — Integridad, cierre y sustentación

| HU | Actividad | Responsable | Entregable |
|---|---|---|---|
| HU-19 | Implementar triggers y stored procedures de integridad | Daniel | `/database/triggers_procedures.sql` |
| HU-16 | Crear tablas del módulo de notificación | Kevin | Tablas `promotion`, `alert`, `term_condition`, `customer_loyalty` |
| HU-22 | Consolidar seguimiento diario del sprint | Maria | `/doc/seguimientos.md` completo |
| — | Revisión final, validación de entregables y preparación para sustentación | Todo el equipo | Repo listo para sustentar |

---

## Resumen de entregables por persona

### Kevin
| HU | Entregable |
|---|---|
| HU-03 | `/adr/adr_postgresql.md` |
| HU-01 | Estructura de auditoría documentada en `/doc` |
| HU-14 | Tablas `product`, `service`, `supplier`, `product_tracking`, `inventory_availability` |
| HU-15 | Tablas `room_maintenance`, `usage_maintenance`, `renovation_maintenance`, `maintenance_dashboard` |
| HU-16 | Tablas `promotion`, `alert`, `term_condition`, `customer_loyalty` |

### Daniel
| HU | Entregable |
|---|---|
| HU-02 | `/doc/analisis_dominios.md` |
| HU-05 | BD PostgreSQL corriendo + `.env` configurado |
| HU-08 | Usuario `ariel5253` creado con permisos DDL y DML, sin DCL |
| HU-09 | Pruebas de permisos documentadas en `/doc` |
| HU-07 | Tablas módulo de seguridad en `/database/ddl.sql` |
| HU-10 | Tablas módulo de parametrización en `/database/ddl.sql` |
| HU-11 | Tablas módulo de distribución en `/database/ddl.sql` |
| HU-12 | Tablas módulo de prestación de servicio en `/database/ddl.sql` |
| HU-13 | Tablas módulo de facturación en `/database/ddl.sql` |
| HU-17 | `/database/dml_canonical.sql` |
| HU-18 | `/database/dml_volumetric.sql` |
| HU-19 | `/database/triggers_procedures.sql` |

### Laura
| HU | Entregable |
|---|---|
| HU-06 | MER normalizado hasta 3FN exportado en `/doc` (con Daniel) |
| — | Revisión de integridad referencial y datos huérfanos (con Kevin) |

### Maria — Scrum Master
| HU | Entregable |
|---|---|
| HU-04 | Repositorio en GitHub con carpetas y ramas configuradas |
| HU-20 | `/doc/backlog_tecnico.md` |
| HU-21 | `/doc/plan_trabajo_inicial.md` |
| HU-22 | `/doc/seguimientos.md` completo al cierre del sprint |

---

## Criterios de cierre del sprint

- Todas las HUs Must have completadas y en columna **Listo** en Trello
- Repositorio con commits en conventional commits en inglés
- BD con datos canónicos y volumétricos cargados mediante stored procedures
- Usuario `ariel5253` con DDL y DML verificados, sin DCL
- Sin datos huérfanos en ninguna tabla
- Triggers probados con casos válidos e inválidos
- Documentación completa en `/doc` y `/adr`