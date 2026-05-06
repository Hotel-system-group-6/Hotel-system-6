# Analisis de dominios

## Proposito

Este documento define la organizacion por dominios del esquema PostgreSQL del sistema hotelero.

La documentacion se mantiene en espanol para facilitar el seguimiento del proyecto. Los scripts SQL, nombres de tablas, columnas, constraints, indices, triggers y archivos de migracion se mantienen en ingles para cumplir la convencion tecnica acordada.

## Estructura de dominios

El DDL de tablas esta organizado en `01_ddl/03_tables`, con una carpeta por dominio. Cada tabla tiene su propio archivo SQL con formato `001-table_name.sql`.

| Carpeta | Responsabilidad | Tablas |
| --- | --- | --- |
| `01_identity_security` | Clientes, personas, usuarios, roles, permisos, modulos y pantallas. | `customer`, `person`, `app_role`, `permission`, `module`, `screen`, `app_user`, `app_user_role`, `role_permission`, `module_screen` |
| `02_company_operations` | Empresa, informacion legal, empleados y sedes. | `company`, `legal_information`, `employee`, `branch` |
| `03_rooms_reservations` | Habitaciones, disponibilidad, precios, reservas, estadias, check-in y check-out. | `day_type`, `room_type`, `room_status`, `room`, `price`, `room_reservation`, `room_cancellation`, `room_availability`, `room_catalog`, `stay`, `check_in`, `check_out` |
| `04_inventory_services` | Proveedores, productos, servicios, seguimiento e inventario. | `supplier`, `product`, `service`, `product_tracking`, `inventory_availability` |
| `05_billing_payments` | Ventas, prefacturas, facturas, pagos y detalles de compra. | `payment_method`, `product_sale`, `service_sale`, `pre_invoice`, `invoice`, `partial_payment`, `purchase_detail` |
| `06_communication_loyalty` | Promociones, alertas, terminos y fidelizacion. | `promotion`, `alert`, `terms_condition`, `customer_loyalty` |
| `07_maintenance` | Mantenimiento, uso, remodelacion y tablero operativo. | `room_maintenance`, `maintenance_usage`, `maintenance_remodeling`, `maintenance_dashboard` |

## Orden de ejecucion

El orden de los dominios es intencional. Primero se crean las tablas base y luego las tablas que dependen de ellas mediante claves foraneas.

- `person` se crea antes de `app_user` y `employee`.
- `company` se crea antes de `branch` y `legal_information`.
- `room` se crea antes de reservas, estadias, mantenimiento y disponibilidad.
- `stay`, `product`, `service` y `payment_method` se crean antes de facturacion y pagos.

## Registro en Liquibase

El changelog principal de tablas es `01_ddl/03_tables/changelog.yaml`. Este archivo incluye un changelog por dominio. Cada changelog de dominio registra los scripts tabla por tabla y apunta a su rollback correspondiente en `05_rollbacks/01_ddl/03_tables`.

Esta estructura permite cambios pequenos, ownership claro por dominio y rollbacks mas faciles de revisar.

## Schemas PostgreSQL

Ademas de la organizacion por carpetas, las tablas se asignan a schemas PostgreSQL por dominio:

- `identity_security`
- `company_operations`
- `rooms_reservations`
- `inventory_services`
- `billing_payments`
- `communication_loyalty`
- `maintenance`

Los schemas se crean en `01_ddl/01_schemas`. La asignacion de tablas a schemas se hace en `01_ddl/10_schema_assignments` para no modificar los changeSets de tablas que ya podrian estar registrados en una base de datos.
