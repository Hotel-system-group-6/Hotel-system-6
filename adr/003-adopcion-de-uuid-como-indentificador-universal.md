# ADR-003: Adopción de UUID como identificador universal de todas las tablas

## Estado

Aceptada

## Fecha 

2026-05-06

---

## Contexto

El documento `05_id_y_auditoria.md` define los campos comunes que deben estar presentes en todas las tablas del sistema. Entre los pendientes por confirmar se identificó la elección del tipo definitivo de `id`: `BIGINT`, `UUID`, `CHAR(36)` o `BINARY(16)`.

El sistema hotelero tiene características que hacen relevante esta decisión:

- Cubre múltiples dominios funcionales con tablas distribuidas en 8 schemas de PostgreSQL.
- Incluye entidades críticas con trazabilidad sensible: reservas, facturas, pagos, usuarios, habitaciones y movimientos de inventario.
- Puede integrarse con sistemas externos como pasarelas de pago, canales de notificación y otras plataformas.
- El modelo contempla eliminación lógica de registros, lo que implica que los identificadores deben ser estables y no reutilizables.
- PostgreSQL 13 en adelante incluye la función `gen_random_uuid()` de forma nativa, sin necesidad de extensiones adicionales.

El uso de `BIGINT AUTO_INCREMENT` (o `BIGSERIAL` en PostgreSQL) implica identificadores secuenciales predecibles, lo que expone información sobre el volumen de registros y facilita ataques de enumeración en APIs o URLs. También dificulta la generación de identificadores fuera de la base de datos (por ejemplo, en la capa de aplicación o en procesos de integración).

---

## Decisión

    Se adopta **UUID** (`gen_random_uuid()`) como tipo de identificador para todas las tablas del sistema.

### Definición del campo `id` en PostgreSQL

```sql
id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY
```

### Campos de auditoría relacionados

Los campos `created_by`, `updated_by` y `deleted_by` también usarán tipo `UUID` para mantener consistencia con el identificador de `security.app_user`:

```sql
id          UUID      NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
created_by  UUID      NULL,
created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
updated_by  UUID      NULL,
updated_at  TIMESTAMPTZ NULL,
deleted_by  UUID      NULL,
deleted_at  TIMESTAMPTZ NULL,
status      VARCHAR(30) NOT NULL DEFAULT 'ACTIVE'
```

> Nota: se usa `TIMESTAMPTZ` en lugar de `DATETIME` por ser el tipo recomendado en PostgreSQL para fechas con zona horaria.

### Representación en la aplicación

Los UUID se representan como `String` en la capa de aplicación y se transfieren en formato estándar con guiones: `xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx`.

---

## Consecuencias

### Positivas

- Los identificadores son globalmente únicos, lo que elimina colisiones entre tablas, schemas y sistemas externos.
- No exponen información sobre el volumen de registros ni son predecibles por enumeración.
- Permiten generar el `id` en la capa de aplicación antes de persistir el registro, lo que facilita operaciones optimistas y flujos de integración.
- PostgreSQL soporta `UUID` como tipo nativo con almacenamiento eficiente de 16 bytes.
- `gen_random_uuid()` está disponible de forma nativa desde PostgreSQL 13, sin necesidad de habilitar la extensión `pgcrypto` ni `uuid-ossp`.
- La consistencia de tipo entre `id` y los campos de auditoría (`created_by`, `updated_by`, `deleted_by`) simplifica las relaciones y las consultas.

### Negativas

- Los UUID no son ordenables cronológicamente por defecto, a diferencia de un `BIGSERIAL`. Si se requiere ordenamiento por tiempo de creación, debe usarse el campo `created_at`.
- Los índices sobre columnas UUID son ligeramente más grandes que los índices sobre `BIGINT` (16 bytes vs 8 bytes), lo que puede impactar el rendimiento en tablas con altísimo volumen de registros.
- Los UUID son menos legibles visualmente durante depuración o revisión manual de datos.
- Los datos semilla y scripts de prueba deben usar UUID válidos en lugar de enteros simples.

---

## Tablas afectadas

La decisión aplica a las 46 tablas del modelo, distribuidas en los 8 schemas de dominio:

**parameterization**: cliente, precio, empresa, informacion_legal, empleado, tipo_dia, metodo_pago.

**distribution**: sede, habitacion, tipo_habitacion, estado_habitacion.

**service_delivery**: reserva_habitacion, cancelacion_habitacion, disponibilidad_habitacion, catalogo_habitacion, check_in, check_out, estadia, venta_producto, venta_servicio.

**billing**: pre_factura, pago_parcial, factura, detalle_compra.

**inventory**: producto, servicio, proveedor, seguimiento_producto, disponibilidad_inventario.

**notification**: promocion, alerta, termino_condicion, fidelizacion_cliente.

**security**: persona, usuario, rol, permiso, modulo, vista, usuario_rol, rol_permiso, modulo_vista.

**maintenance**: mantenimiento_habitacion, mantenimiento_uso, mantenimiento_remodelacion, dashboard_mantenimiento.

---

## Plan de implementación

1. Actualizar la plantilla base de campos comunes en la documentación del proyecto (`05_id_y_auditoria.md`) para reflejar UUID como tipo definitivo.
2. Ajustar todos los scripts DDL existentes reemplazando `BIGINT` o `BIGSERIAL` por `UUID DEFAULT gen_random_uuid()`.
3. Actualizar las llaves foráneas en todos los scripts para usar tipo `UUID`.
4. Ajustar los datos semilla para que usen UUID válidos (pueden generarse con `gen_random_uuid()` directamente en los scripts SQL).
5. Actualizar los smoke tests para validar el tipo de columna `id` como `uuid` en el catálogo de PostgreSQL.
6. Verificar que la capa de aplicación use `String` o el tipo UUID nativo del lenguaje para representar los identificadores.

---

## Criterios de aceptación

- Todas las tablas tienen `id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY`.
- Los campos `created_by`, `updated_by` y `deleted_by` son de tipo `UUID NULL` en todas las tablas.
- Todas las llaves foráneas que referencian un `id` usan tipo `UUID`.
- Liquibase valida los changelogs sin errores.
- Los smoke tests confirman que el tipo de `id` es `uuid` en el catálogo de PostgreSQL (`information_schema.columns`).
- Los datos semilla contienen UUID válidos generados correctamente.

---

## Decisiones relacionadas

- ADR-001: Migración a PostgreSQL como motor relacional del proyecto.
- ADR-002: Uso de schemas por dominio en PostgreSQL.
