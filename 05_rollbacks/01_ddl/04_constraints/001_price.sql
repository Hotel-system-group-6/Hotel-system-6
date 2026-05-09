-- PARAMETERIZATION: price
ALTER TABLE price DROP CONSTRAINT fk_price_room_type;
ALTER TABLE price DROP CONSTRAINT fk_price_day_type;
