-- SECURITY: role_permission
ALTER TABLE role_permission DROP CONSTRAINT fk_role_permission_app_role;
ALTER TABLE role_permission DROP CONSTRAINT fk_role_permission_permission;
