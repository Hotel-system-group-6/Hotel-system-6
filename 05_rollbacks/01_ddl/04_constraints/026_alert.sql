-- NOTIFICATION: alert
ALTER TABLE alert DROP CONSTRAINT fk_alert_customer;
ALTER TABLE alert DROP CONSTRAINT fk_alert_reservation;
