# ADR-001: Migrar el motor de base de datos de MySQL a PostgreSQL

## Estado

Aceptada

## Fecha

2026-05-05

## Revisión

2026-05-06 — Se incorpora contexto completo del modelo de dominio (46 tablas, 8 módulos funcionales) y se alinea con las decisiones de ADR-002 y ADR-003.

---

## Contexto

El sistema hotelero cubre el ciclo operativo completo de un hotel o cadena de sedes: reservas, check in, check out, estadías, ventas internas, facturación, inventario, notificaciones, seguridad y mantenimiento.

El modelo de datos está compuesto por 46 tablas agrupadas en 8 módulos funcionales:

- **Parametrización**: cliente, precio, empresa, informacion_legal, empleado, tipo_dia, metodo_pago.
- **Distribución**: sede, habitacion, tipo_habitacion, estado_habitacion.
- **Prestación de servicio**: reserva_habitacion, cancelacion_habitacion, disponibilidad_habitacion, catalogo_habitacion, check_in, check_out, estadia, venta_producto, venta_servicio.
- **Facturación**: pre_factura, pago_parcial, factura, detalle_compra.
- **Inventario**: producto, servicio, proveedor, seguimiento_producto, disponibilidad_inventario.
- **Notificación**: promocion, alerta, termino_condicion, fidelizacion_cliente.
- **Seguridad**: persona, usuario, rol, permiso, modulo, vista, usuario_rol, rol_permiso, modulo_vista.
- **Mantenimiento**: mantenimiento_habitacion, mantenimiento_uso, mantenimiento_remodelacion, dashboard_mantenimiento.

El dominio incluye procesos críticos como precios dinámicos por tipo de día, secuencias de estadía con consumos asociados, eliminación lógica de registros mediante campos de auditoría, y control de acceso por rol y permiso.

El proyecto inició con un esquema MySQL. La necesidad de evolución controlada del modelo, integridad referencial robusta, soporte nativo de UUID (ver ADR-003), tipos avanzados y migraciones versionadas motivó la evaluación de alternativas.

---

## Decisión

Se adopta **PostgreSQL 16** como motor relacional principal del proyecto.

- El entorno local se levanta mediante **Docker Compose** con imagen oficial de PostgreSQL 16.
- **Liquibase** gestiona todos los cambios de esquema y datos mediante changelogs versionados.
- El modelo se organiza en **schemas por dominio** según ADR-002.
- Los identificadores de todas las tablas usan **UUID v4** según ADR-003.

---

## Convención de idioma

La documentación del proyecto puede mantenerse en español. Los artefactos SQL deben estar en inglés:

- Nombres de archivos SQL.
- Tablas, columnas, constraints, índices, triggers.
- Valores por defecto que representen estados funcionales (por ejemplo `'ACTIVE'`, `'AVAILABLE'`).

---

## Esquema base

El modelo contiene 46 tablas distribuidas en 7 schemas de dominio (ver ADR-002):

| Schema | Módulo funcional |
|---|---|
| `identity_security` | Seguridad |
| `company_operations` | Parametrización |
| `rooms_reservations` | Distribución y Prestación de servicio |
| `inventory_services` | Inventario |
| `billing_payments` | Facturación |
| `communication_loyalty` | Notificación |
| `maintenance` | Mantenimiento |

Todas las tablas incluyen los campos comunes de identificación y auditoría definidos en el estándar del proyecto: `id` (UUID), `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`, `status`.

---

## Consecuencias

### Positivas

- El proyecto queda alineado con PostgreSQL, Liquibase y una convención SQL uniforme en inglés.
- Los cambios quedan versionados por dominio y por tabla, lo que facilita rollbacks selectivos.
- PostgreSQL soporta UUID nativo (`gen_random_uuid()`), lo que habilita ADR-003 sin extensiones adicionales desde la versión 13 en adelante.
- La separación en schemas (ADR-002) refuerza el aislamiento lógico de dominios y habilita estrategias de permisos por schema.
- La documentación sigue siendo accesible para el equipo en español.

### Negativas

- Los scripts y smoke tests que usen nombres en español deben actualizarse.
- Los datos semilla deben ajustarse al contrato SQL en inglés.
- Las consultas deben usar nombres calificados con schema (`rooms_reservations.room`), o configurar correctamente el `search_path`.
- La aplicación cliente debe referenciar tablas y columnas con los nombres en inglés.

---

## Plan de implementación

1. Convertir DDL MySQL a PostgreSQL.
2. Separar un archivo SQL por tabla.
3. Agrupar scripts por dominio bajo `01_ddl/`.
4. Traducir el contrato SQL a inglés.
5. Crear schemas de dominio en `01_ddl/01_schemas/`.
6. Asignar tablas a schemas en `01_ddl/10_schema_assignments/`.
7. Registrar cada script como changeSet en Liquibase.
8. Crear rollback por tabla.
9. Convertir smoke tests y datos semilla.
10. Validar contra PostgreSQL 16 real.

---

## Criterios de aceptación

- Liquibase valida todos los changelogs sin errores de checksum ni conflictos.
- PostgreSQL 16 aplica todos los scripts correctamente.
- Las 46 tablas existen con nombres en inglés, distribuidas en los 7 schemas de dominio.
- Constraints, índices y triggers usan nombres en inglés con convención uniforme.
- Todos los identificadores son UUID v4 (ver ADR-003).
- La documentación describe la organización y las decisiones principales.
- No quedan dependencias activas hacia MySQL.

---

## Decisiones relacionadas

- ADR-002: Uso de schemas por dominio en PostgreSQL.
- ADR-003: Adopción de UUID v4 como identificador universal de todas las tablas.