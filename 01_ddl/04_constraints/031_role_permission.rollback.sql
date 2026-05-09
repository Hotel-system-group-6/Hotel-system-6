-- SECURITY: role_permission
ALTER TABLE role_permission
ADD CONSTRAINT fk_role_permission_app_role FOREIGN KEY (role_id) REFERENCES app_role (id);

ALTER TABLE role_permission
ADD CONSTRAINT fk_role_permission_permission FOREIGN KEY (permission_id) REFERENCES permission (id);
