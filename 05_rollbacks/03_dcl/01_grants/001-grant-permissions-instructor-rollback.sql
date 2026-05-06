ALTER DEFAULT PRIVILEGES IN SCHEMA
  parameterization,
  distribution,
  service_delivery,
  billing,
  inventory,
  notification,
  security,
  maintenance
REVOKE USAGE, SELECT, UPDATE ON SEQUENCES FROM role_instructor;

ALTER DEFAULT PRIVILEGES IN SCHEMA
  parameterization,
  distribution,
  service_delivery,
  billing,
  inventory,
  notification,
  security,
  maintenance
REVOKE SELECT, INSERT, UPDATE, DELETE ON TABLES FROM role_instructor;

REVOKE USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA
  parameterization,
  distribution,
  service_delivery,
  billing,
  inventory,
  notification,
  security,
  maintenance
FROM role_instructor;

REVOKE SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA
  parameterization,
  distribution,
  service_delivery,
  billing,
  inventory,
  notification,
  security,
  maintenance
FROM role_instructor;

REVOKE USAGE ON SCHEMA
  parameterization,
  distribution,
  service_delivery,
  billing,
  inventory,
  notification,
  security,
  maintenance
FROM role_instructor;

REVOKE EXECUTE ON FUNCTION public.set_updated_at() FROM role_instructor;
REVOKE USAGE ON SCHEMA public FROM role_instructor;
REVOKE CONNECT, TEMPORARY ON DATABASE hotel_system FROM role_instructor;
