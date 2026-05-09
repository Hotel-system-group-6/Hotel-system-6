# ADR-005: Separación de constraints en una etapa DDL dedicada

## Estado

Aceptada

## Fecha

2026-05-09

---

## Contexto

El modelo del sistema hotelero tiene relaciones entre tablas de varios dominios funcionales: parametrización, distribución, prestación de servicio, facturación, inventario, notificación, seguridad y mantenimiento.

Al migrar y organizar la base en PostgreSQL con Liquibase, incluir todas las llaves foráneas directamente dentro de los scripts de creación de tablas aumenta el acoplamiento entre archivos y hace más difícil controlar el orden de ejecución. También puede generar problemas cuando una tabla referencia a otra que todavía no fue creada, cuando existen dependencias entre dominios o cuando se necesita ajustar una relación sin tocar changeSets históricos.

Para evitar ese problema se creó la carpeta `01_ddl/04_constraints/`, donde se concentran los scripts que agregan constraints después de que las tablas base ya existen.

---

## Decisión

Se define `01_ddl/04_constraints/` como una etapa DDL dedicada para declarar constraints relacionales, principalmente llaves foráneas.

Cada archivo representa las constraints asociadas a una tabla:

```text
01_ddl/04_constraints/001_price.sql
01_ddl/04_constraints/008_room_reservation.sql
01_ddl/04_constraints/032_module_screen.sql
```

El patrón usado es:

```sql
ALTER TABLE <tabla>
ADD CONSTRAINT <nombre_constraint>
FOREIGN KEY (<columna>)
REFERENCES <tabla_referenciada> (id);
```

El `changelog.yaml` de la carpeta registra cada archivo como un changeSet independiente, con su rollback correspondiente en:

```text
05_rollbacks/01_ddl/04_constraints/
```

La carpeta se ejecuta después de la creación de schemas y tablas, porque depende de que las entidades referenciadas existan previamente. Su objetivo es completar la integridad referencial del modelo sin mezclar esa responsabilidad con la definición estructural inicial de cada tabla.

---

## Consecuencias

### Positivas

- Se reduce el riesgo de errores por orden de creación entre tablas relacionadas.
- Las tablas pueden crearse primero y las relaciones aplicarse después de forma controlada.
- Cada grupo de constraints queda versionado como changeSet independiente.
- Los rollbacks son más simples, porque pueden eliminar constraints sin recrear tablas.
- La revisión del modelo relacional es más clara: las llaves foráneas están centralizadas en una etapa específica.
- Se evita modificar scripts históricos de tablas cuando se agregan o corrigen relaciones.
- Las relaciones obligatorias protegen el borrado físico de entidades maestras mediante `ON DELETE RESTRICT` explícito.

### Negativas

- La estructura de una tabla queda repartida entre su archivo de creación y su archivo de constraints.
- Durante una ejecución parcial, puede existir una base con tablas creadas pero sin todas sus llaves foráneas.
- Los scripts posteriores deben considerar que la integridad referencial completa solo existe después de ejecutar `04_constraints`.
- Al usar schemas de dominio, las referencias pueden requerir nombres calificados cuando las tablas ya no estén en `public`.

---

## Reglas de uso

- Los scripts de `04_constraints` deben enfocarse en constraints agregadas con `ALTER TABLE`.
- Cada archivo debe agrupar las constraints de una sola tabla siempre que sea posible.
- Los nombres de constraints deben ser explícitos y descriptivos, usando el prefijo `fk_` para llaves foráneas.
- Las llaves foráneas obligatorias deben declarar `ON DELETE RESTRICT` de forma explícita.
- `ON DELETE SET NULL` solo debe usarse cuando la relación sea opcional y la columna FK permita valores `NULL`.
- Todo changeSet de constraints debe tener rollback equivalente con `DROP CONSTRAINT`.
- No se deben crear tablas, datos semilla, índices, funciones, triggers ni permisos en esta carpeta.
- Si una relación cruza schemas, la referencia debe quedar alineada con la estrategia definida en los ADR de schemas.

---

## Decisiones relacionadas

- ADR-001: Migración de MySQL a PostgreSQL.
- ADR-002: Uso de schemas por módulo funcional en PostgreSQL.
- ADR-004: Asignación de tablas a schemas de dominio.
