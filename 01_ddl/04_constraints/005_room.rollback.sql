-- DISTRIBUTION: room
ALTER TABLE room
ADD CONSTRAINT fk_room_branch FOREIGN KEY (branch_id) REFERENCES branch (id);

ALTER TABLE room
ADD CONSTRAINT fk_room_type FOREIGN KEY (room_type_id) REFERENCES room_type (id);

ALTER TABLE room
ADD CONSTRAINT fk_room_status FOREIGN KEY (room_status_id) REFERENCES room_status (id);
