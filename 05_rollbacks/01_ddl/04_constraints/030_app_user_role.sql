-- SECURITY: app_user_role
ALTER TABLE app_user_role DROP CONSTRAINT fk_app_user_role_app_user;
ALTER TABLE app_user_role DROP CONSTRAINT fk_app_user_role_app_role;
