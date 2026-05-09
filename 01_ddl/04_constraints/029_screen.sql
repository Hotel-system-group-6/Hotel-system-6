-- SECURITY: screen
ALTER TABLE screen
ADD CONSTRAINT fk_screen_module FOREIGN KEY (module_id) REFERENCES module (id);
