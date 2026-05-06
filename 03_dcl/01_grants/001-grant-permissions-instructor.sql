GRANT CONNECT, TEMPORARY ON DATABASE hotel_system TO role_instructor;

GRANT USAGE ON SCHEMA public TO role_instructor;
GRANT EXECUTE ON FUNCTION public.set_updated_at() TO role_instructor;

GRANT USAGE ON SCHEMA
  parameterization,
  distribution,
  service_delivery,
  billing,
  inventory,
  notification,
  security,
  maintenance
TO role_instructor;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA
  parameterization,
  distribution,
  service_delivery,
  billing,
  inventory,
  notification,
  security,
  maintenance
TO role_instructor;

GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA
  parameterization,
  distribution,
  service_delivery,
  billing,
  inventory,
  notification,
  security,
  maintenance
TO role_instructor;

ALTER DEFAULT PRIVILEGES IN SCHEMA
  parameterization,
  distribution,
  service_delivery,
  billing,
  inventory,
  notification,
  security,
  maintenance
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_instructor;

ALTER DEFAULT PRIVILEGES IN SCHEMA
  parameterization,
  distribution,
  service_delivery,
  billing,
  inventory,
  notification,
  security,
  maintenance
GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO role_instructor;
