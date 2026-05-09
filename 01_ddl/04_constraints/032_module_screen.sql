-- SECURITY: module_screen
ALTER TABLE module_screen
ADD CONSTRAINT fk_module_screen_module FOREIGN KEY (module_id) REFERENCES module (id);

ALTER TABLE module_screen
ADD CONSTRAINT fk_module_screen_screen FOREIGN KEY (screen_id) REFERENCES screen (id);
