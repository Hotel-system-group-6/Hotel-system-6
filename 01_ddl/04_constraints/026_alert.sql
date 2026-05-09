-- NOTIFICATION: alert
ALTER TABLE alert
ADD CONSTRAINT fk_alert_customer FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE alert
ADD CONSTRAINT fk_alert_reservation FOREIGN KEY (room_reservation_id) REFERENCES room_reservation (id);
