-- SECURITY: app_user_role
ALTER TABLE app_user_role
ADD CONSTRAINT fk_app_user_role_app_user FOREIGN KEY (app_user_id) REFERENCES app_user (id);

ALTER TABLE app_user_role
ADD CONSTRAINT fk_app_user_role_app_role FOREIGN KEY (role_id) REFERENCES app_role (id);
