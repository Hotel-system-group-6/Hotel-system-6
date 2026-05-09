-- PARAMETERIZATION: price
ALTER TABLE price
ADD CONSTRAINT fk_price_room_type FOREIGN KEY (room_type_id) REFERENCES room_type (id) ON DELETE RESTRICT;

ALTER TABLE price
ADD CONSTRAINT fk_price_day_type FOREIGN KEY (day_type_id) REFERENCES day_type (id) ON DELETE RESTRICT;
