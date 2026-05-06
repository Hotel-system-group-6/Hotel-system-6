# ADR-002: Uso de schemas por dominio en PostgreSQL

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

Se utilizan **7 schemas de dominio** en PostgreSQL para organizar las 46 tablas del modelo:

| Schema | Módulo funcional | Tablas |
|---|---|---|
| `identity_security` | Seguridad | persona, usuario, rol, permiso, modulo, vista, usuario_rol, rol_permiso, modulo_vista |
| `company_operations` | Parametrización | cliente, precio, empresa, informacion_legal, empleado, tipo_dia, metodo_pago |
| `rooms_reservations` | Distribución y Prestación de servicio | sede, habitacion, tipo_habitacion, estado_habitacion, reserva_habitacion, cancelacion_habitacion, disponibilidad_habitacion, catalogo_habitacion, check_in, check_out, estadia, venta_producto, venta_servicio |
| `inventory_services` | Inventario | producto, servicio, proveedor, seguimiento_producto, disponibilidad_inventario |
| `billing_payments` | Facturación | pre_factura, pago_parcial, factura, detalle_compra |
| `communication_loyalty` | Notificación | promocion, alerta, termino_condicion, fidelizacion_cliente |
| `maintenance` | Mantenimiento | mantenimiento_habitacion, mantenimiento_uso, mantenimiento_remodelacion, dashboard_mantenimiento |

Los schemas se crean en `01_ddl/01_schemas/`.

Las tablas se mueven desde `public` hacia su schema de dominio mediante changeSets nuevos en `01_ddl/10_schema_assignments/`. Esto evita reescribir los changeSets existentes de creación de tablas y elimina el riesgo de conflictos de checksum en bases con historial previo.

---

## Convención de nombres calificados

Todas las referencias entre tablas que pertenezcan a schemas distintos deben usar el nombre calificado completo: `schema.tabla`. Por ejemplo:

- `rooms_reservations.reservation` referencia a `company_operations.customer`.
- `billing_payments.invoice` referencia a `rooms_reservations.stay`.
- `identity_security.employee` referencia a `identity_security.person`.

El `search_path` de la aplicación debe configurarse explícitamente para incluir los schemas necesarios, o bien usar siempre nombres calificados en las consultas.

---

## Consecuencias

### Positivas

- El modelo queda separado por dominios reales dentro de PostgreSQL, reflejando la arquitectura funcional del sistema.
- Se habilita una futura estrategia de permisos por schema (por ejemplo, un rol de base de datos solo con acceso a `billing_payments`).
- Las herramientas de administración muestran una estructura más clara y navegable.
- Se evita modificar changeSets de tablas que podrían estar registrados en bases con historial existente.
- La separación por schemas complementa la organización de scripts por carpeta de dominio.

### Negativas

- Las consultas y referencias entre tablas de schemas distintos deben usar nombres calificados.
- El `search_path` debe configurarse con cuidado en la aplicación y en las herramientas de administración.
- Los datos semilla y smoke tests deben usar los schemas correctos en todas las referencias.
- Las llaves foráneas entre tablas de schemas distintos son válidas en PostgreSQL pero requieren que ambos schemas estén accesibles en el contexto de la sesión.

---

## Criterios de aceptación

- Los 7 schemas de dominio existen en la base de datos.
- Las 46 tablas están asignadas al schema correspondiente según la tabla de este ADR.
- Liquibase valida el changelog completo sin errores.
- Los smoke tests y datos semilla usan nombres calificados correctamente.
- La documentación explica el motivo de la separación por schemas y la asignación de cada tabla.

---

## Decisiones relacionadas

- ADR-001: Migración a PostgreSQL como motor relacional del proyecto.
- ADR-003: Adopción de UUID v4 como identificador universal de todas las tablas.