# Plan de datos de prueba

## Proposito

Este plan define los datos minimos necesarios para validar el esquema PostgreSQL migrado.

## Orden recomendado de carga

1. Parametrizacion: `customer`, `price`, `company`, `legal_information`, `employee`, `day_type`, `payment_method`.
2. Distribucion: `branch`, `room`, `room_type`, `room_status`.
3. Prestacion de servicio: `room_reservation`, `room_cancellation`, `room_availability`, `room_catalog`, `check_in`, `check_out`, `stay`, `product_sale`, `service_sale`.
4. Facturacion: `pre_invoice`, `partial_payment`, `invoice`, `purchase_detail`.
5. Inventario: `product`, `service`, `supplier`, `product_tracking`, `inventory_availability`.
6. Notificacion: `promotion`, `alert`, `terms_condition`, `customer_loyalty`.
7. Seguridad: `person`, `app_user`, `app_role`, `permission`, `module`, `screen`, `app_user_role`, `role_permission`, `module_screen`.
8. Mantenimiento: `room_maintenance`, `maintenance_usage`, `maintenance_remodeling`, `maintenance_dashboard`.

## Datos minimos para smoke test

- Una empresa.
- Una sede.
- Un cliente.
- Un empleado y un usuario.
- Un tipo de habitacion.
- Un estado de habitacion.
- Una habitacion.
- Una reserva.
- Una estadia.
- Un metodo de pago.
- Una factura o prefactura.

## Validaciones

El smoke test debe validar conteo de tablas, columnas de auditoria, datos base, joins principales de habitaciones y relaciones basicas de facturacion.

Los scripts de datos y smoke tests deben usar nombres calificados con schema cuando consulten tablas, por ejemplo `parameterization.customer`, `distribution.room` y `billing.invoice`.
