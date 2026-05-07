# ADR-002: Uso de schemas por modulo funcional en PostgreSQL

## Estado

Aceptada

## Fecha

2026-05-05

## Revisión

2026-05-06 — Se documenta la asignación explícita de las 46 tablas por schema, se incorpora la relación con ADR-001 y ADR-003, y se ajusta el plan de implementación.

---

## Contexto

El modelo del sistema hotelero contiene 46 tablas que cubren 8 módulos funcionales. Si todas las tablas residen en el schema `public`, la base de datos pierde la separación lógica que sí existe en la estructura de carpetas de los scripts SQL.

PostgreSQL permite separar tablas en schemas nombrados, lo que ofrece aislamiento lógico, base para una futura estrategia de permisos por dominio y mayor claridad al administrar o consultar el modelo directamente desde el motor.

Existe además una restricción operativa importante con Liquibase: editar changeSets que ya fueron ejecutados contra una base con historial en `databasechangelog` genera diferencias de checksum y puede bloquear el pipeline de migraciones. Por eso la asignación de tablas a schemas se implementa como changeSets nuevos y aditivos, no como modificaciones a los changeSets originales de creación de tablas.

---

## Decisión

Se utilizan **8 schemas de dominio** en PostgreSQL para organizar las 46 tablas del modelo:

| Schema | Módulo funcional | Tablas |
|---|---|---|
| `parameterization` | Parametrización | cliente, precio, empresa, informacion_legal, empleado, tipo_dia, metodo_pago |
| `distribution` | Distribución | sede, habitacion, tipo_habitacion, estado_habitacion |
| `service_delivery` | Prestación de servicio | reserva_habitacion, cancelacion_habitacion, disponibilidad_habitacion, catalogo_habitacion, check_in, check_out, estadia, venta_producto, venta_servicio |
| `billing` | Facturación | pre_factura, pago_parcial, factura, detalle_compra |
| `inventory` | Inventario | producto, servicio, proveedor, seguimiento_producto, disponibilidad_inventario |
| `notification` | Notificación | promocion, alerta, termino_condicion, fidelizacion_cliente |
| `security` | Seguridad | persona, usuario, rol, permiso, modulo, vista, usuario_rol, rol_permiso, modulo_vista |
| `maintenance` | Mantenimiento | mantenimiento_habitacion, mantenimiento_uso, mantenimiento_remodelacion, dashboard_mantenimiento |

Los schemas se crean en `01_ddl/01_schemas/`.

## Convención de nombres calificados

Todas las referencias entre tablas que pertenezcan a schemas distintos deben usar el nombre calificado completo: `schema.tabla`. Por ejemplo:

- `service_delivery.room_reservation` referencia a `parameterization.customer`.
- `billing.invoice` referencia a `service_delivery.stay`.
- `parameterization.employee` referencia a `security.person`.

El `search_path` de la aplicación debe configurarse explícitamente para incluir los schemas necesarios, o bien usar siempre nombres calificados en las consultas.

---

## Consecuencias

### Positivas

- El modelo queda separado por modulos funcionales dentro de PostgreSQL.
- Se habilita una futura estrategia de permisos por schema.
- Las consultas y herramientas de administracion muestran una estructura mas clara.
- Se evita editar changeSets de tablas que podrian estar registrados en una base existente.

### Negativas

- Las consultas nuevas deben usar nombres calificados, por ejemplo `distribution.room`, `service_delivery.room_reservation` o `billing.invoice`.
- El `search_path` debe configurarse con cuidado si una aplicacion consulta sin schema.
- Los datos semilla y smoke tests deben usar los schemas correctos.

## Decisiones relacionadas

- Los 8 schemas funcionales existen.
- Las 46 tablas quedan asignadas a su schema correspondiente.
- Liquibase valida el changelog sin errores.
- La documentacion explica el motivo de la separacion por schemas.
