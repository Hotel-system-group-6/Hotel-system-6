# Plan de datos de prueba

## Proposito

Este plan define los datos minimos necesarios para validar el esquema PostgreSQL migrado.

## Orden recomendado de carga

1. Identidad y seguridad: `customer`, `person`, `app_role`, `permission`, `module`, `screen`, `app_user`.
2. Operacion de empresa: `company`, `legal_information`, `employee`, `branch`.
3. Habitaciones: `day_type`, `room_type`, `room_status`, `room`, `price`.
4. Reservas y estadias: `room_reservation`, `room_availability`, `room_catalog`, `stay`, `check_in`, `check_out`.
5. Inventario y servicios: `supplier`, `product`, `service`, `product_tracking`, `inventory_availability`.
6. Facturacion y pagos: `product_sale`, `service_sale`, `pre_invoice`, `invoice`, `partial_payment`, `purchase_detail`.
7. Comunicacion y fidelizacion: `promotion`, `alert`, `terms_condition`, `customer_loyalty`.
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

Los scripts de datos y smoke tests deben usar nombres calificados con schema cuando consulten tablas, por ejemplo `identity_security.customer`, `rooms_reservations.room` y `billing_payments.invoice`.
