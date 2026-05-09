-- Sample data seed: five rows per table, with eight functional modules.

CREATE TEMP TABLE seed_uuid_map (
  entity VARCHAR(80) NOT NULL,
  row_no SMALLINT NOT NULL,
  id UUID NOT NULL,
  PRIMARY KEY (entity, row_no)
) ON COMMIT DROP;

INSERT INTO seed_uuid_map (entity, row_no, id)
VALUES
  ('customer', 1, '00000000-0000-0000-0000-000001000001'::uuid),
  ('customer', 2, '00000000-0000-0000-0000-000001000002'::uuid),
  ('customer', 3, '00000000-0000-0000-0000-000001000003'::uuid),
  ('customer', 4, '00000000-0000-0000-0000-000001000004'::uuid),
  ('customer', 5, '00000000-0000-0000-0000-000001000005'::uuid),
  ('person', 1, '00000000-0000-0000-0000-000002000001'::uuid),
  ('person', 2, '00000000-0000-0000-0000-000002000002'::uuid),
  ('person', 3, '00000000-0000-0000-0000-000002000003'::uuid),
  ('person', 4, '00000000-0000-0000-0000-000002000004'::uuid),
  ('person', 5, '00000000-0000-0000-0000-000002000005'::uuid),
  ('app_role', 1, '00000000-0000-0000-0000-000003000001'::uuid),
  ('app_role', 2, '00000000-0000-0000-0000-000003000002'::uuid),
  ('app_role', 3, '00000000-0000-0000-0000-000003000003'::uuid),
  ('app_role', 4, '00000000-0000-0000-0000-000003000004'::uuid),
  ('app_role', 5, '00000000-0000-0000-0000-000003000005'::uuid),
  ('permission', 1, '00000000-0000-0000-0000-000004000001'::uuid),
  ('permission', 2, '00000000-0000-0000-0000-000004000002'::uuid),
  ('permission', 3, '00000000-0000-0000-0000-000004000003'::uuid),
  ('permission', 4, '00000000-0000-0000-0000-000004000004'::uuid),
  ('permission', 5, '00000000-0000-0000-0000-000004000005'::uuid),
  ('module', 1, '00000000-0000-0000-0000-000005000001'::uuid),
  ('module', 2, '00000000-0000-0000-0000-000005000002'::uuid),
  ('module', 3, '00000000-0000-0000-0000-000005000003'::uuid),
  ('module', 4, '00000000-0000-0000-0000-000005000004'::uuid),
  ('module', 5, '00000000-0000-0000-0000-000005000005'::uuid),
  ('module', 6, '00000000-0000-0000-0000-000005000006'::uuid),
  ('module', 7, '00000000-0000-0000-0000-000005000007'::uuid),
  ('module', 8, '00000000-0000-0000-0000-000005000008'::uuid),
  ('screen', 1, '00000000-0000-0000-0000-000006000001'::uuid),
  ('screen', 2, '00000000-0000-0000-0000-000006000002'::uuid),
  ('screen', 3, '00000000-0000-0000-0000-000006000003'::uuid),
  ('screen', 4, '00000000-0000-0000-0000-000006000004'::uuid),
  ('screen', 5, '00000000-0000-0000-0000-000006000005'::uuid),
  ('screen', 6, '00000000-0000-0000-0000-000006000006'::uuid),
  ('screen', 7, '00000000-0000-0000-0000-000006000007'::uuid),
  ('screen', 8, '00000000-0000-0000-0000-000006000008'::uuid),
  ('app_user', 1, '00000000-0000-0000-0000-000007000001'::uuid),
  ('app_user', 2, '00000000-0000-0000-0000-000007000002'::uuid),
  ('app_user', 3, '00000000-0000-0000-0000-000007000003'::uuid),
  ('app_user', 4, '00000000-0000-0000-0000-000007000004'::uuid),
  ('app_user', 5, '00000000-0000-0000-0000-000007000005'::uuid),
  ('app_user_role', 1, '00000000-0000-0000-0000-000008000001'::uuid),
  ('app_user_role', 2, '00000000-0000-0000-0000-000008000002'::uuid),
  ('app_user_role', 3, '00000000-0000-0000-0000-000008000003'::uuid),
  ('app_user_role', 4, '00000000-0000-0000-0000-000008000004'::uuid),
  ('app_user_role', 5, '00000000-0000-0000-0000-000008000005'::uuid),
  ('role_permission', 1, '00000000-0000-0000-0000-000009000001'::uuid),
  ('role_permission', 2, '00000000-0000-0000-0000-000009000002'::uuid),
  ('role_permission', 3, '00000000-0000-0000-0000-000009000003'::uuid),
  ('role_permission', 4, '00000000-0000-0000-0000-000009000004'::uuid),
  ('role_permission', 5, '00000000-0000-0000-0000-000009000005'::uuid),
  ('module_screen', 1, '00000000-0000-0000-0000-000010000001'::uuid),
  ('module_screen', 2, '00000000-0000-0000-0000-000010000002'::uuid),
  ('module_screen', 3, '00000000-0000-0000-0000-000010000003'::uuid),
  ('module_screen', 4, '00000000-0000-0000-0000-000010000004'::uuid),
  ('module_screen', 5, '00000000-0000-0000-0000-000010000005'::uuid),
  ('module_screen', 6, '00000000-0000-0000-0000-000010000006'::uuid),
  ('module_screen', 7, '00000000-0000-0000-0000-000010000007'::uuid),
  ('module_screen', 8, '00000000-0000-0000-0000-000010000008'::uuid),
  ('company', 1, '00000000-0000-0000-0000-000011000001'::uuid),
  ('company', 2, '00000000-0000-0000-0000-000011000002'::uuid),
  ('company', 3, '00000000-0000-0000-0000-000011000003'::uuid),
  ('company', 4, '00000000-0000-0000-0000-000011000004'::uuid),
  ('company', 5, '00000000-0000-0000-0000-000011000005'::uuid),
  ('legal_information', 1, '00000000-0000-0000-0000-000012000001'::uuid),
  ('legal_information', 2, '00000000-0000-0000-0000-000012000002'::uuid),
  ('legal_information', 3, '00000000-0000-0000-0000-000012000003'::uuid),
  ('legal_information', 4, '00000000-0000-0000-0000-000012000004'::uuid),
  ('legal_information', 5, '00000000-0000-0000-0000-000012000005'::uuid),
  ('employee', 1, '00000000-0000-0000-0000-000013000001'::uuid),
  ('employee', 2, '00000000-0000-0000-0000-000013000002'::uuid),
  ('employee', 3, '00000000-0000-0000-0000-000013000003'::uuid),
  ('employee', 4, '00000000-0000-0000-0000-000013000004'::uuid),
  ('employee', 5, '00000000-0000-0000-0000-000013000005'::uuid),
  ('branch', 1, '00000000-0000-0000-0000-000014000001'::uuid),
  ('branch', 2, '00000000-0000-0000-0000-000014000002'::uuid),
  ('branch', 3, '00000000-0000-0000-0000-000014000003'::uuid),
  ('branch', 4, '00000000-0000-0000-0000-000014000004'::uuid),
  ('branch', 5, '00000000-0000-0000-0000-000014000005'::uuid),
  ('day_type', 1, '00000000-0000-0000-0000-000015000001'::uuid),
  ('day_type', 2, '00000000-0000-0000-0000-000015000002'::uuid),
  ('day_type', 3, '00000000-0000-0000-0000-000015000003'::uuid),
  ('day_type', 4, '00000000-0000-0000-0000-000015000004'::uuid),
  ('day_type', 5, '00000000-0000-0000-0000-000015000005'::uuid),
  ('room_type', 1, '00000000-0000-0000-0000-000016000001'::uuid),
  ('room_type', 2, '00000000-0000-0000-0000-000016000002'::uuid),
  ('room_type', 3, '00000000-0000-0000-0000-000016000003'::uuid),
  ('room_type', 4, '00000000-0000-0000-0000-000016000004'::uuid),
  ('room_type', 5, '00000000-0000-0000-0000-000016000005'::uuid),
  ('room_status', 1, '00000000-0000-0000-0000-000017000001'::uuid),
  ('room_status', 2, '00000000-0000-0000-0000-000017000002'::uuid),
  ('room_status', 3, '00000000-0000-0000-0000-000017000003'::uuid),
  ('room_status', 4, '00000000-0000-0000-0000-000017000004'::uuid),
  ('room_status', 5, '00000000-0000-0000-0000-000017000005'::uuid),
  ('room', 1, '00000000-0000-0000-0000-000018000001'::uuid),
  ('room', 2, '00000000-0000-0000-0000-000018000002'::uuid),
  ('room', 3, '00000000-0000-0000-0000-000018000003'::uuid),
  ('room', 4, '00000000-0000-0000-0000-000018000004'::uuid),
  ('room', 5, '00000000-0000-0000-0000-000018000005'::uuid),
  ('price', 1, '00000000-0000-0000-0000-000019000001'::uuid),
  ('price', 2, '00000000-0000-0000-0000-000019000002'::uuid),
  ('price', 3, '00000000-0000-0000-0000-000019000003'::uuid),
  ('price', 4, '00000000-0000-0000-0000-000019000004'::uuid),
  ('price', 5, '00000000-0000-0000-0000-000019000005'::uuid),
  ('room_reservation', 1, '00000000-0000-0000-0000-000020000001'::uuid),
  ('room_reservation', 2, '00000000-0000-0000-0000-000020000002'::uuid),
  ('room_reservation', 3, '00000000-0000-0000-0000-000020000003'::uuid),
  ('room_reservation', 4, '00000000-0000-0000-0000-000020000004'::uuid),
  ('room_reservation', 5, '00000000-0000-0000-0000-000020000005'::uuid),
  ('room_cancellation', 1, '00000000-0000-0000-0000-000021000001'::uuid),
  ('room_cancellation', 2, '00000000-0000-0000-0000-000021000002'::uuid),
  ('room_cancellation', 3, '00000000-0000-0000-0000-000021000003'::uuid),
  ('room_cancellation', 4, '00000000-0000-0000-0000-000021000004'::uuid),
  ('room_cancellation', 5, '00000000-0000-0000-0000-000021000005'::uuid),
  ('room_availability', 1, '00000000-0000-0000-0000-000022000001'::uuid),
  ('room_availability', 2, '00000000-0000-0000-0000-000022000002'::uuid),
  ('room_availability', 3, '00000000-0000-0000-0000-000022000003'::uuid),
  ('room_availability', 4, '00000000-0000-0000-0000-000022000004'::uuid),
  ('room_availability', 5, '00000000-0000-0000-0000-000022000005'::uuid),
  ('room_catalog', 1, '00000000-0000-0000-0000-000023000001'::uuid),
  ('room_catalog', 2, '00000000-0000-0000-0000-000023000002'::uuid),
  ('room_catalog', 3, '00000000-0000-0000-0000-000023000003'::uuid),
  ('room_catalog', 4, '00000000-0000-0000-0000-000023000004'::uuid),
  ('room_catalog', 5, '00000000-0000-0000-0000-000023000005'::uuid),
  ('stay', 1, '00000000-0000-0000-0000-000024000001'::uuid),
  ('stay', 2, '00000000-0000-0000-0000-000024000002'::uuid),
  ('stay', 3, '00000000-0000-0000-0000-000024000003'::uuid),
  ('stay', 4, '00000000-0000-0000-0000-000024000004'::uuid),
  ('stay', 5, '00000000-0000-0000-0000-000024000005'::uuid),
  ('check_in', 1, '00000000-0000-0000-0000-000025000001'::uuid),
  ('check_in', 2, '00000000-0000-0000-0000-000025000002'::uuid),
  ('check_in', 3, '00000000-0000-0000-0000-000025000003'::uuid),
  ('check_in', 4, '00000000-0000-0000-0000-000025000004'::uuid),
  ('check_in', 5, '00000000-0000-0000-0000-000025000005'::uuid),
  ('check_out', 1, '00000000-0000-0000-0000-000026000001'::uuid),
  ('check_out', 2, '00000000-0000-0000-0000-000026000002'::uuid),
  ('check_out', 3, '00000000-0000-0000-0000-000026000003'::uuid),
  ('check_out', 4, '00000000-0000-0000-0000-000026000004'::uuid),
  ('check_out', 5, '00000000-0000-0000-0000-000026000005'::uuid),
  ('supplier', 1, '00000000-0000-0000-0000-000027000001'::uuid),
  ('supplier', 2, '00000000-0000-0000-0000-000027000002'::uuid),
  ('supplier', 3, '00000000-0000-0000-0000-000027000003'::uuid),
  ('supplier', 4, '00000000-0000-0000-0000-000027000004'::uuid),
  ('supplier', 5, '00000000-0000-0000-0000-000027000005'::uuid),
  ('product', 1, '00000000-0000-0000-0000-000028000001'::uuid),
  ('product', 2, '00000000-0000-0000-0000-000028000002'::uuid),
  ('product', 3, '00000000-0000-0000-0000-000028000003'::uuid),
  ('product', 4, '00000000-0000-0000-0000-000028000004'::uuid),
  ('product', 5, '00000000-0000-0000-0000-000028000005'::uuid),
  ('service', 1, '00000000-0000-0000-0000-000029000001'::uuid),
  ('service', 2, '00000000-0000-0000-0000-000029000002'::uuid),
  ('service', 3, '00000000-0000-0000-0000-000029000003'::uuid),
  ('service', 4, '00000000-0000-0000-0000-000029000004'::uuid),
  ('service', 5, '00000000-0000-0000-0000-000029000005'::uuid),
  ('product_tracking', 1, '00000000-0000-0000-0000-000030000001'::uuid),
  ('product_tracking', 2, '00000000-0000-0000-0000-000030000002'::uuid),
  ('product_tracking', 3, '00000000-0000-0000-0000-000030000003'::uuid),
  ('product_tracking', 4, '00000000-0000-0000-0000-000030000004'::uuid),
  ('product_tracking', 5, '00000000-0000-0000-0000-000030000005'::uuid),
  ('inventory_availability', 1, '00000000-0000-0000-0000-000031000001'::uuid),
  ('inventory_availability', 2, '00000000-0000-0000-0000-000031000002'::uuid),
  ('inventory_availability', 3, '00000000-0000-0000-0000-000031000003'::uuid),
  ('inventory_availability', 4, '00000000-0000-0000-0000-000031000004'::uuid),
  ('inventory_availability', 5, '00000000-0000-0000-0000-000031000005'::uuid),
  ('payment_method', 1, '00000000-0000-0000-0000-000032000001'::uuid),
  ('payment_method', 2, '00000000-0000-0000-0000-000032000002'::uuid),
  ('payment_method', 3, '00000000-0000-0000-0000-000032000003'::uuid),
  ('payment_method', 4, '00000000-0000-0000-0000-000032000004'::uuid),
  ('payment_method', 5, '00000000-0000-0000-0000-000032000005'::uuid),
  ('product_sale', 1, '00000000-0000-0000-0000-000033000001'::uuid),
  ('product_sale', 2, '00000000-0000-0000-0000-000033000002'::uuid),
  ('product_sale', 3, '00000000-0000-0000-0000-000033000003'::uuid),
  ('product_sale', 4, '00000000-0000-0000-0000-000033000004'::uuid),
  ('product_sale', 5, '00000000-0000-0000-0000-000033000005'::uuid),
  ('service_sale', 1, '00000000-0000-0000-0000-000034000001'::uuid),
  ('service_sale', 2, '00000000-0000-0000-0000-000034000002'::uuid),
  ('service_sale', 3, '00000000-0000-0000-0000-000034000003'::uuid),
  ('service_sale', 4, '00000000-0000-0000-0000-000034000004'::uuid),
  ('service_sale', 5, '00000000-0000-0000-0000-000034000005'::uuid),
  ('pre_invoice', 1, '00000000-0000-0000-0000-000035000001'::uuid),
  ('pre_invoice', 2, '00000000-0000-0000-0000-000035000002'::uuid),
  ('pre_invoice', 3, '00000000-0000-0000-0000-000035000003'::uuid),
  ('pre_invoice', 4, '00000000-0000-0000-0000-000035000004'::uuid),
  ('pre_invoice', 5, '00000000-0000-0000-0000-000035000005'::uuid),
  ('invoice', 1, '00000000-0000-0000-0000-000036000001'::uuid),
  ('invoice', 2, '00000000-0000-0000-0000-000036000002'::uuid),
  ('invoice', 3, '00000000-0000-0000-0000-000036000003'::uuid),
  ('invoice', 4, '00000000-0000-0000-0000-000036000004'::uuid),
  ('invoice', 5, '00000000-0000-0000-0000-000036000005'::uuid),
  ('partial_payment', 1, '00000000-0000-0000-0000-000037000001'::uuid),
  ('partial_payment', 2, '00000000-0000-0000-0000-000037000002'::uuid),
  ('partial_payment', 3, '00000000-0000-0000-0000-000037000003'::uuid),
  ('partial_payment', 4, '00000000-0000-0000-0000-000037000004'::uuid),
  ('partial_payment', 5, '00000000-0000-0000-0000-000037000005'::uuid),
  ('purchase_detail', 1, '00000000-0000-0000-0000-000038000001'::uuid),
  ('purchase_detail', 2, '00000000-0000-0000-0000-000038000002'::uuid),
  ('purchase_detail', 3, '00000000-0000-0000-0000-000038000003'::uuid),
  ('purchase_detail', 4, '00000000-0000-0000-0000-000038000004'::uuid),
  ('purchase_detail', 5, '00000000-0000-0000-0000-000038000005'::uuid),
  ('promotion', 1, '00000000-0000-0000-0000-000039000001'::uuid),
  ('promotion', 2, '00000000-0000-0000-0000-000039000002'::uuid),
  ('promotion', 3, '00000000-0000-0000-0000-000039000003'::uuid),
  ('promotion', 4, '00000000-0000-0000-0000-000039000004'::uuid),
  ('promotion', 5, '00000000-0000-0000-0000-000039000005'::uuid),
  ('alert', 1, '00000000-0000-0000-0000-000040000001'::uuid),
  ('alert', 2, '00000000-0000-0000-0000-000040000002'::uuid),
  ('alert', 3, '00000000-0000-0000-0000-000040000003'::uuid),
  ('alert', 4, '00000000-0000-0000-0000-000040000004'::uuid),
  ('alert', 5, '00000000-0000-0000-0000-000040000005'::uuid),
  ('terms_condition', 1, '00000000-0000-0000-0000-000041000001'::uuid),
  ('terms_condition', 2, '00000000-0000-0000-0000-000041000002'::uuid),
  ('terms_condition', 3, '00000000-0000-0000-0000-000041000003'::uuid),
  ('terms_condition', 4, '00000000-0000-0000-0000-000041000004'::uuid),
  ('terms_condition', 5, '00000000-0000-0000-0000-000041000005'::uuid),
  ('customer_loyalty', 1, '00000000-0000-0000-0000-000042000001'::uuid),
  ('customer_loyalty', 2, '00000000-0000-0000-0000-000042000002'::uuid),
  ('customer_loyalty', 3, '00000000-0000-0000-0000-000042000003'::uuid),
  ('customer_loyalty', 4, '00000000-0000-0000-0000-000042000004'::uuid),
  ('customer_loyalty', 5, '00000000-0000-0000-0000-000042000005'::uuid),
  ('room_maintenance', 1, '00000000-0000-0000-0000-000043000001'::uuid),
  ('room_maintenance', 2, '00000000-0000-0000-0000-000043000002'::uuid),
  ('room_maintenance', 3, '00000000-0000-0000-0000-000043000003'::uuid),
  ('room_maintenance', 4, '00000000-0000-0000-0000-000043000004'::uuid),
  ('room_maintenance', 5, '00000000-0000-0000-0000-000043000005'::uuid),
  ('maintenance_usage', 1, '00000000-0000-0000-0000-000044000001'::uuid),
  ('maintenance_usage', 2, '00000000-0000-0000-0000-000044000002'::uuid),
  ('maintenance_usage', 3, '00000000-0000-0000-0000-000044000003'::uuid),
  ('maintenance_usage', 4, '00000000-0000-0000-0000-000044000004'::uuid),
  ('maintenance_usage', 5, '00000000-0000-0000-0000-000044000005'::uuid),
  ('maintenance_remodeling', 1, '00000000-0000-0000-0000-000045000001'::uuid),
  ('maintenance_remodeling', 2, '00000000-0000-0000-0000-000045000002'::uuid),
  ('maintenance_remodeling', 3, '00000000-0000-0000-0000-000045000003'::uuid),
  ('maintenance_remodeling', 4, '00000000-0000-0000-0000-000045000004'::uuid),
  ('maintenance_remodeling', 5, '00000000-0000-0000-0000-000045000005'::uuid),
  ('maintenance_dashboard', 1, '00000000-0000-0000-0000-000046000001'::uuid),
  ('maintenance_dashboard', 2, '00000000-0000-0000-0000-000046000002'::uuid),
  ('maintenance_dashboard', 3, '00000000-0000-0000-0000-000046000003'::uuid),
  ('maintenance_dashboard', 4, '00000000-0000-0000-0000-000046000004'::uuid),
  ('maintenance_dashboard', 5, '00000000-0000-0000-0000-000046000005'::uuid);

INSERT INTO parameterization.customer (id, document_type, document_number, name, last_name, phone, email, address)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 1), 'CC', '1000000001', 'Laura', 'Gomez', '3001110001', 'laura.gomez@example.com', 'Calle 10 #1-20'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 2), 'CC', '1000000002', 'Carlos', 'Perez', '3001110002', 'carlos.perez@example.com', 'Carrera 15 #22-18'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 3), 'CE', '1000000003', 'Marta', 'Lopez', '3001110003', 'marta.lopez@example.com', 'Avenida 30 #5-40'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 4), 'PASSPORT', 'P100000004', 'David', 'Smith', '3001110004', 'david.smith@example.com', 'Calle 45 #12-09'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 5), 'CC', '1000000005', 'Sofia', 'Ramirez', '3001110005', 'sofia.ramirez@example.com', 'Diagonal 8 #70-21');

INSERT INTO security.person (id, document_type, document_number, name, last_name, phone, email)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 1), 'CC', '2000000001', 'Ana', 'Rojas', '3012220001', 'ana.rojas@hotel.local'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 2), 'CC', '2000000002', 'Miguel', 'Torres', '3012220002', 'miguel.torres@hotel.local'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 3), 'CC', '2000000003', 'Paula', 'Castro', '3012220003', 'paula.castro@hotel.local'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 4), 'CE', '2000000004', 'Julian', 'Vega', '3012220004', 'julian.vega@hotel.local'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 5), 'CC', '2000000005', 'Camila', 'Moreno', '3012220005', 'camila.moreno@hotel.local');

INSERT INTO security.app_role (id, name, description)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 1), 'ADMIN', 'Full system administration role'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 2), 'MANAGER', 'Hotel operations manager role'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 3), 'RECEPTIONIST', 'Front desk and reservation role'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 4), 'HOUSEKEEPING', 'Room cleaning and maintenance role'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 5), 'ACCOUNTING', 'Billing and payment control role');

INSERT INTO security.permission (id, name, description, action)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'permission' AND row_no = 1), 'CUSTOMER_MANAGEMENT', 'Manage hotel customers', 'READ'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'permission' AND row_no = 2), 'RESERVATION_MANAGEMENT', 'Create and update reservations', 'CREATE'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'permission' AND row_no = 3), 'ROOM_MANAGEMENT', 'Update room information', 'UPDATE'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'permission' AND row_no = 4), 'INVENTORY_MANAGEMENT', 'Control inventory records', 'UPDATE'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'permission' AND row_no = 5), 'BILLING_MANAGEMENT', 'Issue and review invoices', 'APPROVE');

INSERT INTO security.module (id, name, description, base_path)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 1), 'Parametrización', 'Gestión de cliente, precio dinámico, empresa, información legal, empleado, tipo de día y método de pago', '/parametrizacion'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 2), 'Distribución', 'Gestión de sede, habitación, tipo de habitación y estado de habitación', '/distribucion'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 3), 'Prestación de servicio', 'Catálogo, disponibilidad, reserva, cancelación, check in, check out, estadía y ventas', '/prestacion-servicio'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 4), 'Facturación', 'Pre facturación, seguimiento de pago parcial, factura y detalle de compra', '/facturacion'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 5), 'Inventario', 'Producto, servicio, proveedor, seguimiento de producto y consulta de disponibilidad', '/inventario'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 6), 'Notificación', 'Promoción, alerta, término y condición, y fidelización de cliente', '/notificacion'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 7), 'Seguridad', 'Persona, usuario, rol, permiso, módulo y vista', '/seguridad'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 8), 'Mantenimiento', 'Mantenimiento por uso, mantenimiento por remodelación y dashboard operativo', '/mantenimiento');

INSERT INTO security.screen (id, module_id, name, description, path)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 1), 'Parametrización', 'Pantalla principal del módulo Parametrización', '/parametrizacion'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 2), 'Distribución', 'Pantalla principal del módulo Distribución', '/distribucion'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 3), 'Prestación de servicio', 'Pantalla principal del módulo Prestación de servicio', '/prestacion-servicio'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 4), 'Facturación', 'Pantalla principal del módulo Facturación', '/facturacion'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 5), 'Inventario', 'Pantalla principal del módulo Inventario', '/inventario'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 6), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 6), 'Notificación', 'Pantalla principal del módulo Notificación', '/notificacion'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 7), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 7), 'Seguridad', 'Pantalla principal del módulo Seguridad', '/seguridad'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 8), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 8), 'Mantenimiento', 'Pantalla principal del módulo Mantenimiento', '/mantenimiento');

INSERT INTO security.app_user (id, person_id, username, password_hash, last_access_at, blocked)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_user' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 1), 'arojas', 'sample_hash_001', '2026-05-01 08:30:00', false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_user' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 2), 'mtorres', 'sample_hash_002', '2026-05-01 09:00:00', false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_user' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 3), 'pcastro', 'sample_hash_003', '2026-05-01 09:30:00', false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_user' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 4), 'jvega', 'sample_hash_004', '2026-05-01 10:00:00', false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_user' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 5), 'cmoreno', 'sample_hash_005', '2026-05-01 10:30:00', false);

INSERT INTO security.app_user_role (id, app_user_id, role_id)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_user_role' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'app_user' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 1)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_user_role' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'app_user' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 2)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_user_role' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'app_user' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 3)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_user_role' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'app_user' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 4)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'app_user_role' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'app_user' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 5));

INSERT INTO security.role_permission (id, role_id, permission_id)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'role_permission' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'permission' AND row_no = 1)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'role_permission' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'permission' AND row_no = 2)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'role_permission' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'permission' AND row_no = 3)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'role_permission' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'permission' AND row_no = 4)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'role_permission' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'app_role' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'permission' AND row_no = 5));

INSERT INTO security.module_screen (id, module_id, screen_id)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module_screen' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 1)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module_screen' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 2)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module_screen' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 3)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module_screen' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 4)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module_screen' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 5)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module_screen' AND row_no = 6), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 6), (SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 6)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module_screen' AND row_no = 7), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 7), (SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 7)),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'module_screen' AND row_no = 8), (SELECT id FROM seed_uuid_map WHERE entity = 'module' AND row_no = 8), (SELECT id FROM seed_uuid_map WHERE entity = 'screen' AND row_no = 8));

INSERT INTO parameterization.company (id, name, tax_id, legal_name, phone, email, address, website)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 1), 'Hotel Central Plaza', 'NIT900001001', 'Hotel Central Plaza S.A.S.', '6015551001', 'contacto@centralplaza.example', 'Calle 100 #10-01', 'https://centralplaza.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 2), 'Hotel Norte Suites', 'NIT900001002', 'Hotel Norte Suites S.A.S.', '6015551002', 'contacto@nortesuites.example', 'Avenida Norte #20-15', 'https://nortesuites.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 3), 'Hotel Pacifico Real', 'NIT900001003', 'Hotel Pacifico Real S.A.S.', '6015551003', 'contacto@pacificoreal.example', 'Carrera 7 #45-22', 'https://pacificoreal.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 4), 'Hotel Montana Azul', 'NIT900001004', 'Hotel Montana Azul S.A.S.', '6015551004', 'contacto@montanaazul.example', 'Calle 60 #8-30', 'https://montanaazul.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 5), 'Hotel Jardin Dorado', 'NIT900001005', 'Hotel Jardin Dorado S.A.S.', '6015551005', 'contacto@jardindorado.example', 'Carrera 12 #34-56', 'https://jardindorado.example');

INSERT INTO parameterization.legal_information (id, company_id, legal_document_type, legal_document_number, description, issue_date, expiration_date)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'legal_information' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 1), 'RNT', 'RNT-2026-001', 'National tourism registry', '2026-01-01', '2026-12-31'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'legal_information' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 2), 'RNT', 'RNT-2026-002', 'National tourism registry', '2026-01-02', '2026-12-31'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'legal_information' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 3), 'RNT', 'RNT-2026-003', 'National tourism registry', '2026-01-03', '2026-12-31'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'legal_information' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 4), 'RNT', 'RNT-2026-004', 'National tourism registry', '2026-01-04', '2026-12-31'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'legal_information' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 5), 'RNT', 'RNT-2026-005', 'National tourism registry', '2026-01-05', '2026-12-31');

INSERT INTO parameterization.employee (id, person_id, job_title, hire_date, work_phone, work_email)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 1), 'General Manager', '2024-01-15', '6015552001', 'ana.rojas@centralplaza.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 2), 'Operations Manager', '2024-02-10', '6015552002', 'miguel.torres@centralplaza.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 3), 'Reception Agent', '2024-03-05', '6015552003', 'paula.castro@centralplaza.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 4), 'Maintenance Lead', '2024-04-20', '6015552004', 'julian.vega@centralplaza.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'person' AND row_no = 5), 'Accountant', '2024-05-12', '6015552005', 'camila.moreno@centralplaza.example');

INSERT INTO distribution.branch (id, company_id, name, address, city, phone, email)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 1), 'Central Plaza Downtown', 'Calle 100 #10-01', 'Bogota', '6015553001', 'downtown@centralplaza.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 2), 'Norte Suites Main', 'Avenida Norte #20-15', 'Bogota', '6015553002', 'main@nortesuites.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 3), 'Pacifico Real Centro', 'Carrera 7 #45-22', 'Cali', '6025553003', 'centro@pacificoreal.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 4), 'Montana Azul Lodge', 'Calle 60 #8-30', 'Medellin', '6045553004', 'lodge@montanaazul.example'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'company' AND row_no = 5), 'Jardin Dorado Garden', 'Carrera 12 #34-56', 'Cartagena', '6055553005', 'garden@jardindorado.example');

INSERT INTO parameterization.day_type (id, name, description, date, applies_season, applies_holiday, applies_special_day)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'day_type' AND row_no = 1), 'Weekday', 'Standard weekday rate', NULL, false, false, false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'day_type' AND row_no = 2), 'Weekend', 'Weekend rate', NULL, false, false, false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'day_type' AND row_no = 3), 'Holiday', 'National holiday rate', '2026-07-20', false, true, false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'day_type' AND row_no = 4), 'High Season', 'High demand season rate', NULL, true, false, false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'day_type' AND row_no = 5), 'Special Event', 'City event rate', '2026-12-31', false, false, true);

INSERT INTO distribution.room_type (id, name, description, base_capacity, max_capacity)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 1), 'Single', 'Single guest room', 1, 1),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 2), 'Double', 'Two guest room', 2, 2),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 3), 'Suite', 'Suite with lounge area', 2, 3),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 4), 'Family', 'Family room with extra beds', 4, 5),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 5), 'Deluxe', 'Deluxe room with premium view', 2, 4);

INSERT INTO distribution.room_status (id, name, description, allows_reservation, allows_check_in)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_status' AND row_no = 1), 'Available', 'Room ready for reservations', true, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_status' AND row_no = 2), 'Occupied', 'Room currently occupied', false, false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_status' AND row_no = 3), 'Maintenance', 'Room under maintenance', false, false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_status' AND row_no = 4), 'Cleaning', 'Room being cleaned', false, false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_status' AND row_no = 5), 'Reserved', 'Room already reserved', false, true);

INSERT INTO distribution.room (id, branch_id, room_type_id, room_status_id, number, floor, capacity, description)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_status' AND row_no = 1), '101', 1, 1, 'Single room near lobby'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_status' AND row_no = 5), '202', 2, 2, 'Double room with city view'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_status' AND row_no = 2), '303', 3, 3, 'Suite with workspace'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_status' AND row_no = 3), '404', 4, 5, 'Family room under scheduled care'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_status' AND row_no = 4), '505', 5, 4, 'Deluxe room pending cleaning');

INSERT INTO parameterization.price (id, room_type_id, day_type_id, amount, start_date, end_date, "condition")
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'price' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'day_type' AND row_no = 1), 180000.00, '2026-01-01', NULL, 'Base weekday price'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'price' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'day_type' AND row_no = 2), 260000.00, '2026-01-01', NULL, 'Weekend price'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'price' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'day_type' AND row_no = 3), 420000.00, '2026-01-01', NULL, 'Holiday price'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'price' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'day_type' AND row_no = 4), 520000.00, '2026-01-01', NULL, 'High season price'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'price' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_type' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'day_type' AND row_no = 5), 650000.00, '2026-01-01', NULL, 'Special event price');

INSERT INTO service_delivery.room_reservation (id, customer_id, room_id, start_date, end_date, guest_count, reservation_status, estimated_amount)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 1), '2026-05-10 15:00:00', '2026-05-12 11:00:00', 1, 'CONFIRMED', 360000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 2), '2026-05-13 15:00:00', '2026-05-15 11:00:00', 2, 'PENDING', 520000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 3), '2026-05-16 15:00:00', '2026-05-18 11:00:00', 2, 'CONFIRMED', 840000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 4), '2026-05-19 15:00:00', '2026-05-22 11:00:00', 4, 'CANCELED', 1560000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 5), '2026-05-23 15:00:00', '2026-05-25 11:00:00', 2, 'CONFIRMED', 1300000.00);

INSERT INTO service_delivery.room_cancellation (id, room_reservation_id, reason, cancelled_at, applies_penalty, penalty_amount)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_cancellation' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 1), 'Customer requested date change', '2026-05-09 10:00:00', false, 0.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_cancellation' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 2), 'Payment not completed', '2026-05-12 09:30:00', true, 52000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_cancellation' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 3), 'Duplicate reservation', '2026-05-15 14:00:00', false, 0.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_cancellation' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 4), 'Customer travel issue', '2026-05-18 18:45:00', true, 156000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_cancellation' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 5), 'Weather disruption', '2026-05-22 08:15:00', false, 0.00);

INSERT INTO service_delivery.room_availability (id, room_id, start_date, end_date, available, unavailable_reason)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_availability' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 1), '2026-05-01 00:00:00', '2026-05-31 23:59:00', true, NULL),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_availability' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 2), '2026-05-01 00:00:00', '2026-05-31 23:59:00', true, NULL),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_availability' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 3), '2026-05-01 00:00:00', '2026-05-31 23:59:00', false, 'Occupied'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_availability' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 4), '2026-05-01 00:00:00', '2026-05-31 23:59:00', false, 'Maintenance'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_availability' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 5), '2026-05-01 00:00:00', '2026-05-31 23:59:00', false, 'Cleaning');

INSERT INTO service_delivery.room_catalog (id, room_id, title, description, base_price, visible)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_catalog' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 1), 'Single Room 101', 'Compact room for one guest', 180000.00, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_catalog' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 2), 'Double Room 202', 'Comfortable room for two guests', 260000.00, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_catalog' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 3), 'Suite 303', 'Suite with lounge and desk', 420000.00, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_catalog' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 4), 'Family Room 404', 'Large room for families', 520000.00, false),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_catalog' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 5), 'Deluxe Room 505', 'Premium room with city view', 650000.00, true);

INSERT INTO service_delivery.stay (id, room_reservation_id, customer_id, room_id, start_date, end_date, stay_status)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 1), '2026-05-10 15:20:00', '2026-05-12 10:45:00', 'COMPLETED'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 2), '2026-05-13 15:10:00', '2026-05-15 10:50:00', 'COMPLETED'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 3), '2026-05-16 15:30:00', NULL, 'ACTIVE'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 4), '2026-05-19 16:00:00', '2026-05-22 10:30:00', 'COMPLETED'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 5), '2026-05-23 15:40:00', NULL, 'ACTIVE');

INSERT INTO service_delivery.check_in (id, room_reservation_id, employee_id, checked_in_at, note)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'check_in' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 3), '2026-05-10 15:20:00', 'Guest arrived on time'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'check_in' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 3), '2026-05-13 15:10:00', 'Guest requested quiet floor'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'check_in' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 2), '2026-05-16 15:30:00', 'Suite amenities confirmed'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'check_in' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 1), '2026-05-19 16:00:00', 'Family group check-in'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'check_in' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 3), '2026-05-23 15:40:00', 'Deluxe welcome package delivered');

INSERT INTO service_delivery.check_out (id, stay_id, employee_id, checked_out_at, note, total_amount)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'check_out' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 5), '2026-05-12 10:45:00', 'Paid in full', 390000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'check_out' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 5), '2026-05-15 10:50:00', 'Invoice sent by email', 580000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'check_out' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 5), '2026-05-18 11:00:00', 'Late checkout approved', 930000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'check_out' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 5), '2026-05-22 10:30:00', 'No pending charges', 1700000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'check_out' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 5), '2026-05-25 10:55:00', 'Customer requested receipt', 1450000.00);

INSERT INTO inventory.supplier (id, name, tax_id, phone, email, address)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'supplier' AND row_no = 1), 'Fresh Foods Ltda', 'SUP900001001', '6015554001', 'ventas@freshfoods.example', 'Zona Industrial 1'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'supplier' AND row_no = 2), 'CleanPro Services', 'SUP900001002', '6015554002', 'ventas@cleanpro.example', 'Zona Industrial 2'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'supplier' AND row_no = 3), 'Comfort Textiles', 'SUP900001003', '6015554003', 'ventas@comforttextiles.example', 'Zona Industrial 3'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'supplier' AND row_no = 4), 'MiniBar Express', 'SUP900001004', '6015554004', 'ventas@minibar.example', 'Zona Industrial 4'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'supplier' AND row_no = 5), 'Wellness Supply', 'SUP900001005', '6015554005', 'ventas@wellness.example', 'Zona Industrial 5');

INSERT INTO inventory.product (id, supplier_id, name, description, sale_price, current_stock, minimum_stock)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'supplier' AND row_no = 1), 'Bottled Water', 'Still water 600 ml', 5000.00, 200, 30),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'supplier' AND row_no = 4), 'Chocolate Bar', 'Mini bar chocolate bar', 8000.00, 120, 20),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'supplier' AND row_no = 3), 'Extra Towel', 'Premium extra towel', 15000.00, 80, 10),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'supplier' AND row_no = 2), 'Laundry Bag', 'Disposable laundry bag', 3000.00, 150, 25),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'supplier' AND row_no = 5), 'Spa Kit', 'Personal wellness kit', 35000.00, 45, 8);

INSERT INTO inventory.service (id, name, description, sale_price, available)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 1), 'Breakfast Buffet', 'Daily breakfast buffet service', 45000.00, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 2), 'Airport Transfer', 'One way airport transfer', 90000.00, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 3), 'Laundry Service', 'Standard guest laundry service', 30000.00, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 4), 'Spa Session', 'Relaxing spa session', 160000.00, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 5), 'Late Checkout', 'Late checkout until 4 PM', 70000.00, true);

INSERT INTO inventory.product_tracking (id, product_id, movement_type, quantity, movement_at, note)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product_tracking' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 1), 'IN', 100, '2026-05-01 08:00:00', 'Initial bottled water stock'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product_tracking' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 2), 'IN', 60, '2026-05-01 08:10:00', 'Initial chocolate stock'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product_tracking' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 3), 'OUT', 10, '2026-05-01 08:20:00', 'Housekeeping usage'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product_tracking' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 4), 'IN', 80, '2026-05-01 08:30:00', 'Laundry bag restock'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product_tracking' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 5), 'OUT', 5, '2026-05-01 08:40:00', 'Spa package delivery');

INSERT INTO inventory.inventory_availability (id, product_id, service_id, available_quantity, available, note)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'inventory_availability' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 1), NULL, 200, true, 'Available for minibar'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'inventory_availability' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 2), NULL, 120, true, 'Available for minibar'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'inventory_availability' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 3), NULL, 80, true, 'Available for housekeeping'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'inventory_availability' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 4), NULL, 150, true, 'Available for laundry'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'inventory_availability' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 5), NULL, 45, true, 'Available for wellness packages');

INSERT INTO parameterization.payment_method (id, name, description, requires_reference, allows_partial_payment)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'payment_method' AND row_no = 1), 'Cash', 'Cash payment at front desk', false, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'payment_method' AND row_no = 2), 'Credit Card', 'Credit card payment', true, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'payment_method' AND row_no = 3), 'Bank Transfer', 'Bank transfer payment', true, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'payment_method' AND row_no = 4), 'Digital Wallet', 'Digital wallet payment', true, true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'payment_method' AND row_no = 5), 'Voucher', 'Promotional or company voucher', true, false);

INSERT INTO service_delivery.product_sale (id, stay_id, product_id, quantity, unit_amount, total_amount)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product_sale' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 1), 2, 5000.00, 10000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product_sale' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 2), 3, 8000.00, 24000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product_sale' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 3), 1, 15000.00, 15000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product_sale' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 4), 4, 3000.00, 12000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'product_sale' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 5), 1, 35000.00, 35000.00);

INSERT INTO service_delivery.service_sale (id, stay_id, service_id, quantity, unit_amount, total_amount)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'service_sale' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 1), 2, 45000.00, 90000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'service_sale' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 2), 1, 90000.00, 90000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'service_sale' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 3), 1, 30000.00, 30000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'service_sale' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 4), 2, 160000.00, 320000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'service_sale' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 5), 1, 70000.00, 70000.00);

INSERT INTO billing.pre_invoice (id, stay_id, room_reservation_id, customer_id, subtotal, tax_amount, discount_amount, total)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'pre_invoice' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 1), 360000.00, 68400.00, 38400.00, 390000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'pre_invoice' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 2), 520000.00, 98800.00, 38800.00, 580000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'pre_invoice' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 3), 840000.00, 159600.00, 69600.00, 930000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'pre_invoice' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 4), 1560000.00, 296400.00, 156400.00, 1700000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'pre_invoice' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 5), 1300000.00, 247000.00, 97000.00, 1450000.00);

INSERT INTO billing.invoice (id, customer_id, stay_id, invoice_number, issued_at, subtotal, tax_amount, discount_amount, total, invoice_status)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 1), 'INV-2026-0001', '2026-05-12 11:00:00', 360000.00, 68400.00, 38400.00, 390000.00, 'ISSUED'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 2), 'INV-2026-0002', '2026-05-15 11:05:00', 520000.00, 98800.00, 38800.00, 580000.00, 'ISSUED'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 3), 'INV-2026-0003', '2026-05-18 11:10:00', 840000.00, 159600.00, 69600.00, 930000.00, 'ISSUED'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 4), 'INV-2026-0004', '2026-05-22 11:00:00', 1560000.00, 296400.00, 156400.00, 1700000.00, 'ISSUED'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'stay' AND row_no = 5), 'INV-2026-0005', '2026-05-25 11:15:00', 1300000.00, 247000.00, 97000.00, 1450000.00, 'ISSUED');

INSERT INTO billing.partial_payment (id, room_reservation_id, invoice_id, payment_method_id, amount, paid_at, payment_reference)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'partial_payment' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'payment_method' AND row_no = 1), 390000.00, '2026-05-12 11:10:00', NULL),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'partial_payment' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'payment_method' AND row_no = 2), 300000.00, '2026-05-15 11:15:00', 'CARD-20260515-0002'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'partial_payment' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'payment_method' AND row_no = 3), 500000.00, '2026-05-18 11:20:00', 'TRF-20260518-0003'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'partial_payment' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'payment_method' AND row_no = 4), 850000.00, '2026-05-22 11:10:00', 'WALLET-20260522-0004'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'partial_payment' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'payment_method' AND row_no = 5), 1450000.00, '2026-05-25 11:25:00', 'VOUCHER-20260525-0005');

INSERT INTO billing.purchase_detail (id, invoice_id, product_id, service_id, description, quantity, unit_amount, total_amount)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'purchase_detail' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 1), NULL, 'Bottled water consumption', 2, 5000.00, 10000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'purchase_detail' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 2), NULL, (SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 2), 'Airport transfer service', 1, 90000.00, 90000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'purchase_detail' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 3), NULL, 'Extra towel charge', 1, 15000.00, 15000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'purchase_detail' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 4), NULL, (SELECT id FROM seed_uuid_map WHERE entity = 'service' AND row_no = 4), 'Spa session charge', 2, 160000.00, 320000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'purchase_detail' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'invoice' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'product' AND row_no = 5), NULL, 'Spa kit charge', 1, 35000.00, 35000.00);

INSERT INTO notification.promotion (id, title, description, start_date, end_date, channel, activa)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'promotion' AND row_no = 1), 'Weekday Saver', 'Discount for weekday reservations', '2026-05-01 00:00:00', '2026-05-31 23:59:00', 'EMAIL', true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'promotion' AND row_no = 2), 'Weekend Escape', 'Weekend package campaign', '2026-06-01 00:00:00', '2026-06-30 23:59:00', 'WEB', true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'promotion' AND row_no = 3), 'Family Plan', 'Family room promotion', '2026-07-01 00:00:00', '2026-07-31 23:59:00', 'SOCIAL', true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'promotion' AND row_no = 4), 'Business Stay', 'Business traveler offer', '2026-08-01 00:00:00', '2026-08-31 23:59:00', 'EMAIL', true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'promotion' AND row_no = 5), 'Holiday Nights', 'Holiday season campaign', '2026-12-01 00:00:00', '2026-12-31 23:59:00', 'WEB', true);

INSERT INTO notification.alert (id, customer_id, room_reservation_id, title, mensaje, channel, sent_at)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'alert' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 1), 'Reservation Confirmed', 'Your reservation has been confirmed.', 'EMAIL', '2026-05-01 09:00:00'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'alert' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 2), 'Payment Reminder', 'Please complete your pending payment.', 'SMS', '2026-05-02 09:30:00'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'alert' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 3), 'Check-in Reminder', 'Your check-in starts at 3 PM.', 'EMAIL', '2026-05-03 10:00:00'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'alert' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 4), 'Cancellation Notice', 'Your reservation cancellation was registered.', 'EMAIL', '2026-05-04 10:30:00'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'alert' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_reservation' AND row_no = 5), 'Promotion Available', 'A new promotion is available for your next stay.', 'PUSH', '2026-05-05 11:00:00');

INSERT INTO notification.terms_condition (id, title, content, version, effective_date, mandatory)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'terms_condition' AND row_no = 1), 'General Stay Terms', 'General terms for hotel stays.', '1.0.0', '2026-01-01', true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'terms_condition' AND row_no = 2), 'Reservation Terms', 'Terms for room reservations.', '1.1.0', '2026-02-01', true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'terms_condition' AND row_no = 3), 'Payment Terms', 'Terms for payments and refunds.', '1.2.0', '2026-03-01', true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'terms_condition' AND row_no = 4), 'Privacy Terms', 'Terms for customer privacy.', '1.3.0', '2026-04-01', true),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'terms_condition' AND row_no = 5), 'Promotion Terms', 'Terms for promotions and vouchers.', '1.4.0', '2026-05-01', false);

INSERT INTO notification.customer_loyalty (id, customer_id, level, points, last_interaction_at, note)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'customer_loyalty' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 1), 'BASIC', 120, '2026-05-01 09:00:00', 'New loyalty member'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'customer_loyalty' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 2), 'SILVER', 520, '2026-05-02 09:30:00', 'Frequent weekend guest'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'customer_loyalty' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 3), 'GOLD', 1250, '2026-05-03 10:00:00', 'Business traveler'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'customer_loyalty' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 4), 'PLATINUM', 2500, '2026-05-04 10:30:00', 'International guest'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'customer_loyalty' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'customer' AND row_no = 5), 'BASIC', 80, '2026-05-05 11:00:00', 'Promotion subscriber');

INSERT INTO maintenance.room_maintenance (id, room_id, employee_id, maintenance_type, start_date, end_date, maintenance_status, note)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 4), 'PREVENTIVE', '2026-05-02 08:00:00', '2026-05-02 10:00:00', 'COMPLETED', 'Air conditioning review'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 4), 'CORRECTIVE', '2026-05-03 09:00:00', '2026-05-03 12:00:00', 'COMPLETED', 'Door lock adjustment'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 4), 'INSPECTION', '2026-05-04 08:30:00', NULL, 'IN_PROGRESS', 'Suite inspection'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 4), 'REMODELING', '2026-05-05 07:00:00', NULL, 'PENDING', 'Family room refresh'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'employee' AND row_no = 4), 'CLEANING_SUPPORT', '2026-05-06 08:00:00', '2026-05-06 09:30:00', 'COMPLETED', 'Deep cleaning support');

INSERT INTO maintenance.maintenance_usage (id, room_maintenance_id, usage_reason, activity_detail)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_usage' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 1), 'Scheduled preventive task', 'Checked filters and ventilation'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_usage' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 2), 'Guest reported issue', 'Adjusted electronic lock'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_usage' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 3), 'Monthly inspection', 'Reviewed furniture and fixtures'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_usage' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 4), 'Room improvement plan', 'Prepared room for remodeling'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_usage' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 5), 'Cleaning support', 'Assisted with deep cleaning checklist');

INSERT INTO maintenance.maintenance_remodeling (id, room_maintenance_id, remodeling_description, estimated_budget)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_remodeling' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 1), 'Paint touch-up and minor fixture renewal', 250000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_remodeling' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 2), 'Door hardware replacement plan', 350000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_remodeling' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 3), 'Suite lighting improvement', 900000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_remodeling' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 4), 'Family room furniture refresh', 2500000.00),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_remodeling' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'room_maintenance' AND row_no = 5), 'Deluxe room textile renewal', 1200000.00);

INSERT INTO maintenance.maintenance_dashboard (id, branch_id, total_rooms, available_rooms, occupied_rooms, maintenance_rooms, snapshot_at)
VALUES
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_dashboard' AND row_no = 1), (SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 1), 20, 14, 5, 1, '2026-05-01 07:00:00'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_dashboard' AND row_no = 2), (SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 2), 25, 18, 6, 1, '2026-05-01 07:05:00'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_dashboard' AND row_no = 3), (SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 3), 30, 20, 8, 2, '2026-05-01 07:10:00'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_dashboard' AND row_no = 4), (SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 4), 18, 10, 6, 2, '2026-05-01 07:15:00'),
  ((SELECT id FROM seed_uuid_map WHERE entity = 'maintenance_dashboard' AND row_no = 5), (SELECT id FROM seed_uuid_map WHERE entity = 'branch' AND row_no = 5), 22, 16, 5, 1, '2026-05-01 07:20:00');
