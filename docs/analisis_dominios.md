# Analisis de dominios

## Proposito

Este documento define la organizacion por dominios del esquema PostgreSQL del sistema hotelero.

La documentacion se mantiene en espanol para facilitar el seguimiento del proyecto. Los scripts SQL, nombres de tablas, columnas, constraints, indices, triggers y archivos de migracion se mantienen en ingles para cumplir la convencion tecnica acordada.

## Resultado del analisis funcional

Del modelo salen 8 modulos funcionales. Para que el modelo fisico coincida con el analisis aprobado, cada modulo funcional tiene un schema PostgreSQL propio.

Las carpetas de migracion quedan organizadas por los 8 modulos funcionales y la asignacion final de tablas en PostgreSQL se hace por los 8 schemas funcionales.

## Modulos funcionales

| # | Modulo funcional | Responsabilidad | Entidades |
| --- | --- | --- | --- |
| 1 | Parametrizacion | Parametros base del negocio hotelero. | `cliente`, `precio`, `empresa`, `informacion_legal`, `empleado`, `tipo_dia`, `metodo_pago` |
| 2 | Distribucion | Estructura fisica y comercial de habitaciones. | `sede`, `habitacion`, `tipo_habitacion`, `estado_habitacion` |
| 3 | Prestacion de servicio | Reserva, disponibilidad, check-in, check-out, estadia y consumos. | `reserva_habitacion`, `cancelacion_habitacion`, `disponibilidad_habitacion`, `catalogo_habitacion`, `check_in`, `check_out`, `estadia`, `venta_producto`, `venta_servicio` |
| 4 | Facturacion | Pre facturacion, factura, pagos y detalle de compra. | `pre_factura`, `pago_parcial`, `factura`, `detalle_compra` |
| 5 | Inventario | Productos, servicios, proveedores y disponibilidad. | `producto`, `servicio`, `proveedor`, `seguimiento_producto`, `disponibilidad_inventario` |
| 6 | Notificacion | Promociones, alertas, terminos y fidelizacion. | `promocion`, `alerta`, `termino_condicion`, `fidelizacion_cliente` |
| 7 | Seguridad | Personas, usuarios, roles, permisos, modulos y vistas. | `persona`, `usuario`, `rol`, `permiso`, `modulo`, `vista`, `usuario_rol`, `rol_permiso`, `modulo_vista` |
| 8 | Mantenimiento | Mantenimiento por uso, remodelacion y dashboard operativo. | `mantenimiento_habitacion`, `mantenimiento_uso`, `mantenimiento_remodelacion`, `dashboard_mantenimiento` |

## Carpetas de migracion

El DDL de tablas esta organizado en `01_ddl/03_tables`, con una carpeta por modulo funcional. Cada tabla tiene su propio archivo SQL con formato `001-table_name.sql`.

| Carpeta | Responsabilidad | Tablas |
| --- | --- | --- |
| `01_parameterization` | Parametrizacion. | `customer`, `price`, `company`, `legal_information`, `employee`, `day_type`, `payment_method` |
| `02_distribution` | Distribucion. | `branch`, `room`, `room_type`, `room_status` |
| `03_service_delivery` | Prestacion de servicio. | `room_catalog`, `room_availability`, `room_reservation`, `room_cancellation`, `check_in`, `check_out`, `stay`, `product_sale`, `service_sale` |
| `04_billing` | Facturacion. | `pre_invoice`, `partial_payment`, `invoice`, `purchase_detail` |
| `05_inventory` | Inventario. | `product`, `service`, `supplier`, `product_tracking`, `inventory_availability` |
| `06_notification` | Notificacion. | `promotion`, `alert`, `terms_condition`, `customer_loyalty` |
| `07_security` | Seguridad. | `person`, `app_user`, `app_role`, `permission`, `module`, `screen`, `app_user_role`, `role_permission`, `module_screen` |
| `08_maintenance` | Mantenimiento. | `room_maintenance`, `maintenance_usage`, `maintenance_remodeling`, `maintenance_dashboard` |

Estas carpetas son de organizacion de scripts por modulo. La ubicacion final en PostgreSQL se define en `01_ddl/10_schema_assignments`.

## Orden de ejecucion

El orden de los dominios es intencional. Primero se crean las tablas base y luego las tablas que dependen de ellas mediante claves foraneas.

- `person` se crea antes de `app_user` y `employee`.
- `company` se crea antes de `branch` y `legal_information`.
- `room_type`, `room_status` y `branch` se crean antes de `room`.
- `room` se crea antes de disponibilidad, catalogo, reservas, estadias y mantenimiento.
- `room_reservation` se crea antes de cancelaciones, estadias y check-in.
- `stay`, `product`, `service` y `payment_method` se crean antes de facturacion y pagos.

## Registro en Liquibase

El changelog principal de tablas es `01_ddl/03_tables/changelog.yaml`. Este archivo registra los scripts tabla por tabla en orden de dependencias, apuntando a los archivos ubicados en cada carpeta de modulo y a su rollback correspondiente en `05_rollbacks/01_ddl/03_tables`.

Esta estructura permite cambios pequenos, ownership claro por dominio y rollbacks mas faciles de revisar.

## Schemas PostgreSQL

Ademas de la organizacion por carpetas, las tablas se asignan a 8 schemas PostgreSQL por modulo funcional:

| Schema | Modulo funcional | Tablas |
| --- | --- | --- |
| `parameterization` | Parametrizacion | `customer`, `price`, `company`, `legal_information`, `employee`, `day_type`, `payment_method` |
| `distribution` | Distribucion | `branch`, `room`, `room_type`, `room_status` |
| `service_delivery` | Prestacion de servicio | `room_reservation`, `room_cancellation`, `room_availability`, `room_catalog`, `check_in`, `check_out`, `stay`, `product_sale`, `service_sale` |
| `billing` | Facturacion | `pre_invoice`, `partial_payment`, `invoice`, `purchase_detail` |
| `inventory` | Inventario | `product`, `service`, `supplier`, `product_tracking`, `inventory_availability` |
| `notification` | Notificacion | `promotion`, `alert`, `terms_condition`, `customer_loyalty` |
| `security` | Seguridad | `person`, `app_user`, `app_role`, `permission`, `module`, `screen`, `app_user_role`, `role_permission`, `module_screen` |
| `maintenance` | Mantenimiento | `room_maintenance`, `maintenance_usage`, `maintenance_remodeling`, `maintenance_dashboard` |

Los schemas se crean en `01_ddl/01_schemas`. La asignacion de tablas a schemas se hace en `01_ddl/10_schema_assignments` para no modificar los changeSets de tablas que ya podrian estar registrados en una base de datos.

## Nota sobre auditoria

Auditoria aparece como una preocupacion transversal del modelo, no como un dominio fisico independiente. Todas las tablas usan columnas como `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at` y `status`; ademas, `updated_at` se mantiene con la funcion `set_updated_at()` y triggers por tabla.

Por eso, el conteo recomendado queda asi:

- 8 modulos funcionales de negocio.
- 8 schemas fisicos en PostgreSQL.
- 1 preocupacion transversal de auditoria.
