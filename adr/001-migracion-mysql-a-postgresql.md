# ADR-001: Migrar el motor de base de datos de MySQL a PostgreSQL

## Estado

Aceptada

## Fecha

2026-05-05

## Contexto

El sistema hotelero inicio con un esquema MySQL. El proyecto requiere una base de datos que permita evolucion controlada del modelo, transacciones confiables, integridad referencial y migraciones repetibles mediante scripts versionados.

El dominio incluye procesos criticos como reservas, habitaciones, clientes, pagos, disponibilidad, inventario, mantenimiento y auditoria.

## Decision

Se adopta PostgreSQL como motor relacional principal del proyecto.

PostgreSQL 16 sera la version objetivo para entorno local mediante Docker Compose. Liquibase sera la herramienta para gestionar cambios de esquema y datos.

## Convencion de idioma

La documentacion del proyecto puede mantenerse en espanol. Los scripts SQL deben mantenerse en ingles:

- Nombres de archivos SQL.
- Tablas.
- Columnas.
- Constraints.
- Indices.
- Triggers.
- Valores por defecto que representen estados funcionales.

## Esquema base

El esquema migrado contiene 46 tablas organizadas en 8 modulos funcionales:

- Parametrizacion.
- Distribucion.
- Prestacion de servicio.
- Facturacion.
- Inventario.
- Notificacion.
- Seguridad.
- Mantenimiento.

En la implementacion fisica de PostgreSQL se crea un schema por cada modulo funcional para que el modelo coincida con el analisis aprobado.

## Consecuencias

### Positivas

- El proyecto queda alineado con PostgreSQL y Liquibase.
- Los cambios quedan versionados por dominio y por tabla.
- Los scripts SQL tienen una convencion uniforme en ingles.
- La documentacion sigue siendo accesible para el equipo en espanol.

### Negativas

- Los scripts y smoke tests que usen nombres en espanol deben actualizarse.
- Los datos semilla deben ajustarse al nuevo contrato SQL.
- La aplicacion, si existe, debe usar los nombres SQL en ingles.

## Plan

1. Convertir DDL MySQL a PostgreSQL.
2. Separar una tabla por archivo SQL.
3. Agrupar scripts por dominio.
4. Traducir el contrato SQL a ingles.
5. Registrar cada script en Liquibase.
6. Crear rollbacks por tabla.
7. Convertir smoke tests y datos semilla.
8. Validar contra PostgreSQL real.

## Criterios de aceptacion

- Liquibase valida los changelogs sin errores.
- PostgreSQL aplica todos los scripts correctamente.
- Las 46 tablas existen con nombres en ingles.
- Constraints, indices y triggers usan nombres en ingles.
- La documentacion describe la organizacion y las decisiones principales.
- No quedan dependencias activas hacia MySQL.
