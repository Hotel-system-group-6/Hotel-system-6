-- SECURITY: app_user
ALTER TABLE app_user
ADD CONSTRAINT fk_app_user_person FOREIGN KEY (person_id) REFERENCES person (id);
