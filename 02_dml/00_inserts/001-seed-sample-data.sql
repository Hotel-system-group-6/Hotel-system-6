-- Sample data seed: five rows per table.

INSERT INTO parameterization.customer (id, document_type, document_number, name, last_name, phone, email, address)
VALUES
  (1, 'CC', '1000000001', 'Laura', 'Gomez', '3001110001', 'laura.gomez@example.com', 'Calle 10 #1-20'),
  (2, 'CC', '1000000002', 'Carlos', 'Perez', '3001110002', 'carlos.perez@example.com', 'Carrera 15 #22-18'),
  (3, 'CE', '1000000003', 'Marta', 'Lopez', '3001110003', 'marta.lopez@example.com', 'Avenida 30 #5-40'),
  (4, 'PASSPORT', 'P100000004', 'David', 'Smith', '3001110004', 'david.smith@example.com', 'Calle 45 #12-09'),
  (5, 'CC', '1000000005', 'Sofia', 'Ramirez', '3001110005', 'sofia.ramirez@example.com', 'Diagonal 8 #70-21');

INSERT INTO security.person (id, document_type, document_number, name, last_name, phone, email)
VALUES
  (1, 'CC', '2000000001', 'Ana', 'Rojas', '3012220001', 'ana.rojas@hotel.local'),
  (2, 'CC', '2000000002', 'Miguel', 'Torres', '3012220002', 'miguel.torres@hotel.local'),
  (3, 'CC', '2000000003', 'Paula', 'Castro', '3012220003', 'paula.castro@hotel.local'),
  (4, 'CE', '2000000004', 'Julian', 'Vega', '3012220004', 'julian.vega@hotel.local'),
  (5, 'CC', '2000000005', 'Camila', 'Moreno', '3012220005', 'camila.moreno@hotel.local');

INSERT INTO security.app_role (id, name, description)
VALUES
  (1, 'ADMIN', 'Full system administration role'),
  (2, 'MANAGER', 'Hotel operations manager role'),
  (3, 'RECEPTIONIST', 'Front desk and reservation role'),
  (4, 'HOUSEKEEPING', 'Room cleaning and maintenance role'),
  (5, 'ACCOUNTING', 'Billing and payment control role');

INSERT INTO security.permission (id, name, description, action)
VALUES
  (1, 'CUSTOMER_MANAGEMENT', 'Manage hotel customers', 'READ'),
  (2, 'RESERVATION_MANAGEMENT', 'Create and update reservations', 'CREATE'),
  (3, 'ROOM_MANAGEMENT', 'Update room information', 'UPDATE'),
  (4, 'INVENTORY_MANAGEMENT', 'Control inventory records', 'UPDATE'),
  (5, 'BILLING_MANAGEMENT', 'Issue and review invoices', 'APPROVE');

INSERT INTO security.module (id, name, description, base_path)
VALUES
  (1, 'Dashboard', 'General hotel indicators', '/dashboard'),
  (2, 'Operations', 'Company and branch operations', '/operations'),
  (3, 'Reservations', 'Room reservations and stays', '/reservations'),
  (4, 'Inventory', 'Products and services inventory', '/inventory'),
  (5, 'Billing', 'Invoices and payments', '/billing');

INSERT INTO security.screen (id, module_id, name, description, path)
VALUES
  (1, 1, 'Dashboard Overview', 'Main dashboard screen', '/dashboard/overview'),
  (2, 2, 'Branches', 'Branch administration screen', '/operations/branches'),
  (3, 3, 'Reservations Board', 'Reservation planning screen', '/reservations/board'),
  (4, 4, 'Inventory Availability', 'Inventory availability screen', '/inventory/availability'),
  (5, 5, 'Invoices', 'Invoice administration screen', '/billing/invoices');

INSERT INTO security.app_user (id, person_id, username, password_hash, last_access_at, blocked)
VALUES
  (1, 1, 'arojas', 'sample_hash_001', '2026-05-01 08:30:00', false),
  (2, 2, 'mtorres', 'sample_hash_002', '2026-05-01 09:00:00', false),
  (3, 3, 'pcastro', 'sample_hash_003', '2026-05-01 09:30:00', false),
  (4, 4, 'jvega', 'sample_hash_004', '2026-05-01 10:00:00', false),
  (5, 5, 'cmoreno', 'sample_hash_005', '2026-05-01 10:30:00', false);

INSERT INTO security.app_user_role (id, app_user_id, role_id)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5);

INSERT INTO security.role_permission (id, role_id, permission_id)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5);

INSERT INTO security.module_screen (id, module_id, screen_id)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5);

INSERT INTO parameterization.company (id, name, tax_id, legal_name, phone, email, address, website)
VALUES
  (1, 'Hotel Central Plaza', 'NIT900001001', 'Hotel Central Plaza S.A.S.', '6015551001', 'contacto@centralplaza.example', 'Calle 100 #10-01', 'https://centralplaza.example'),
  (2, 'Hotel Norte Suites', 'NIT900001002', 'Hotel Norte Suites S.A.S.', '6015551002', 'contacto@nortesuites.example', 'Avenida Norte #20-15', 'https://nortesuites.example'),
  (3, 'Hotel Pacifico Real', 'NIT900001003', 'Hotel Pacifico Real S.A.S.', '6015551003', 'contacto@pacificoreal.example', 'Carrera 7 #45-22', 'https://pacificoreal.example'),
  (4, 'Hotel Montana Azul', 'NIT900001004', 'Hotel Montana Azul S.A.S.', '6015551004', 'contacto@montanaazul.example', 'Calle 60 #8-30', 'https://montanaazul.example'),
  (5, 'Hotel Jardin Dorado', 'NIT900001005', 'Hotel Jardin Dorado S.A.S.', '6015551005', 'contacto@jardindorado.example', 'Carrera 12 #34-56', 'https://jardindorado.example');

INSERT INTO parameterization.legal_information (id, company_id, legal_document_type, legal_document_number, description, issue_date, expiration_date)
VALUES
  (1, 1, 'RNT', 'RNT-2026-001', 'National tourism registry', '2026-01-01', '2026-12-31'),
  (2, 2, 'RNT', 'RNT-2026-002', 'National tourism registry', '2026-01-02', '2026-12-31'),
  (3, 3, 'RNT', 'RNT-2026-003', 'National tourism registry', '2026-01-03', '2026-12-31'),
  (4, 4, 'RNT', 'RNT-2026-004', 'National tourism registry', '2026-01-04', '2026-12-31'),
  (5, 5, 'RNT', 'RNT-2026-005', 'National tourism registry', '2026-01-05', '2026-12-31');

INSERT INTO parameterization.employee (id, person_id, job_title, hire_date, work_phone, work_email)
VALUES
  (1, 1, 'General Manager', '2024-01-15', '6015552001', 'ana.rojas@centralplaza.example'),
  (2, 2, 'Operations Manager', '2024-02-10', '6015552002', 'miguel.torres@centralplaza.example'),
  (3, 3, 'Reception Agent', '2024-03-05', '6015552003', 'paula.castro@centralplaza.example'),
  (4, 4, 'Maintenance Lead', '2024-04-20', '6015552004', 'julian.vega@centralplaza.example'),
  (5, 5, 'Accountant', '2024-05-12', '6015552005', 'camila.moreno@centralplaza.example');

INSERT INTO distribution.branch (id, company_id, name, address, city, phone, email)
VALUES
  (1, 1, 'Central Plaza Downtown', 'Calle 100 #10-01', 'Bogota', '6015553001', 'downtown@centralplaza.example'),
  (2, 2, 'Norte Suites Main', 'Avenida Norte #20-15', 'Bogota', '6015553002', 'main@nortesuites.example'),
  (3, 3, 'Pacifico Real Centro', 'Carrera 7 #45-22', 'Cali', '6025553003', 'centro@pacificoreal.example'),
  (4, 4, 'Montana Azul Lodge', 'Calle 60 #8-30', 'Medellin', '6045553004', 'lodge@montanaazul.example'),
  (5, 5, 'Jardin Dorado Garden', 'Carrera 12 #34-56', 'Cartagena', '6055553005', 'garden@jardindorado.example');

INSERT INTO parameterization.day_type (id, name, description, date, applies_season, applies_holiday, applies_special_day)
VALUES
  (1, 'Weekday', 'Standard weekday rate', NULL, false, false, false),
  (2, 'Weekend', 'Weekend rate', NULL, false, false, false),
  (3, 'Holiday', 'National holiday rate', '2026-07-20', false, true, false),
  (4, 'High Season', 'High demand season rate', NULL, true, false, false),
  (5, 'Special Event', 'City event rate', '2026-12-31', false, false, true);

INSERT INTO distribution.room_type (id, name, description, base_capacity, max_capacity)
VALUES
  (1, 'Single', 'Single guest room', 1, 1),
  (2, 'Double', 'Two guest room', 2, 2),
  (3, 'Suite', 'Suite with lounge area', 2, 3),
  (4, 'Family', 'Family room with extra beds', 4, 5),
  (5, 'Deluxe', 'Deluxe room with premium view', 2, 4);

INSERT INTO distribution.room_status (id, name, description, allows_reservation, allows_check_in)
VALUES
  (1, 'Available', 'Room ready for reservations', true, true),
  (2, 'Occupied', 'Room currently occupied', false, false),
  (3, 'Maintenance', 'Room under maintenance', false, false),
  (4, 'Cleaning', 'Room being cleaned', false, false),
  (5, 'Reserved', 'Room already reserved', false, true);

INSERT INTO distribution.room (id, branch_id, room_type_id, room_status_id, number, floor, capacity, description)
VALUES
  (1, 1, 1, 1, '101', 1, 1, 'Single room near lobby'),
  (2, 2, 2, 5, '202', 2, 2, 'Double room with city view'),
  (3, 3, 3, 2, '303', 3, 3, 'Suite with workspace'),
  (4, 4, 4, 3, '404', 4, 5, 'Family room under scheduled care'),
  (5, 5, 5, 4, '505', 5, 4, 'Deluxe room pending cleaning');

INSERT INTO parameterization.price (id, room_type_id, day_type_id, amount, start_date, end_date, "condition")
VALUES
  (1, 1, 1, 180000.00, '2026-01-01', NULL, 'Base weekday price'),
  (2, 2, 2, 260000.00, '2026-01-01', NULL, 'Weekend price'),
  (3, 3, 3, 420000.00, '2026-01-01', NULL, 'Holiday price'),
  (4, 4, 4, 520000.00, '2026-01-01', NULL, 'High season price'),
  (5, 5, 5, 650000.00, '2026-01-01', NULL, 'Special event price');

INSERT INTO service_delivery.room_reservation (id, customer_id, room_id, start_date, end_date, guest_count, reservation_status, estimated_amount)
VALUES
  (1, 1, 1, '2026-05-10 15:00:00', '2026-05-12 11:00:00', 1, 'CONFIRMED', 360000.00),
  (2, 2, 2, '2026-05-13 15:00:00', '2026-05-15 11:00:00', 2, 'PENDING', 520000.00),
  (3, 3, 3, '2026-05-16 15:00:00', '2026-05-18 11:00:00', 2, 'CONFIRMED', 840000.00),
  (4, 4, 4, '2026-05-19 15:00:00', '2026-05-22 11:00:00', 4, 'CANCELED', 1560000.00),
  (5, 5, 5, '2026-05-23 15:00:00', '2026-05-25 11:00:00', 2, 'CONFIRMED', 1300000.00);

INSERT INTO service_delivery.room_cancellation (id, room_reservation_id, reason, cancelled_at, applies_penalty, penalty_amount)
VALUES
  (1, 1, 'Customer requested date change', '2026-05-09 10:00:00', false, 0.00),
  (2, 2, 'Payment not completed', '2026-05-12 09:30:00', true, 52000.00),
  (3, 3, 'Duplicate reservation', '2026-05-15 14:00:00', false, 0.00),
  (4, 4, 'Customer travel issue', '2026-05-18 18:45:00', true, 156000.00),
  (5, 5, 'Weather disruption', '2026-05-22 08:15:00', false, 0.00);

INSERT INTO service_delivery.room_availability (id, room_id, start_date, end_date, available, unavailable_reason)
VALUES
  (1, 1, '2026-05-01 00:00:00', '2026-05-31 23:59:00', true, NULL),
  (2, 2, '2026-05-01 00:00:00', '2026-05-31 23:59:00', true, NULL),
  (3, 3, '2026-05-01 00:00:00', '2026-05-31 23:59:00', false, 'Occupied'),
  (4, 4, '2026-05-01 00:00:00', '2026-05-31 23:59:00', false, 'Maintenance'),
  (5, 5, '2026-05-01 00:00:00', '2026-05-31 23:59:00', false, 'Cleaning');

INSERT INTO service_delivery.room_catalog (id, room_id, title, description, base_price, visible)
VALUES
  (1, 1, 'Single Room 101', 'Compact room for one guest', 180000.00, true),
  (2, 2, 'Double Room 202', 'Comfortable room for two guests', 260000.00, true),
  (3, 3, 'Suite 303', 'Suite with lounge and desk', 420000.00, true),
  (4, 4, 'Family Room 404', 'Large room for families', 520000.00, false),
  (5, 5, 'Deluxe Room 505', 'Premium room with city view', 650000.00, true);

INSERT INTO service_delivery.stay (id, room_reservation_id, customer_id, room_id, start_date, end_date, stay_status)
VALUES
  (1, 1, 1, 1, '2026-05-10 15:20:00', '2026-05-12 10:45:00', 'COMPLETED'),
  (2, 2, 2, 2, '2026-05-13 15:10:00', '2026-05-15 10:50:00', 'COMPLETED'),
  (3, 3, 3, 3, '2026-05-16 15:30:00', NULL, 'ACTIVE'),
  (4, 4, 4, 4, '2026-05-19 16:00:00', '2026-05-22 10:30:00', 'COMPLETED'),
  (5, 5, 5, 5, '2026-05-23 15:40:00', NULL, 'ACTIVE');

INSERT INTO service_delivery.check_in (id, room_reservation_id, employee_id, checked_in_at, note)
VALUES
  (1, 1, 3, '2026-05-10 15:20:00', 'Guest arrived on time'),
  (2, 2, 3, '2026-05-13 15:10:00', 'Guest requested quiet floor'),
  (3, 3, 2, '2026-05-16 15:30:00', 'Suite amenities confirmed'),
  (4, 4, 1, '2026-05-19 16:00:00', 'Family group check-in'),
  (5, 5, 3, '2026-05-23 15:40:00', 'Deluxe welcome package delivered');

INSERT INTO service_delivery.check_out (id, stay_id, employee_id, checked_out_at, note, total_amount)
VALUES
  (1, 1, 5, '2026-05-12 10:45:00', 'Paid in full', 390000.00),
  (2, 2, 5, '2026-05-15 10:50:00', 'Invoice sent by email', 580000.00),
  (3, 3, 5, '2026-05-18 11:00:00', 'Late checkout approved', 930000.00),
  (4, 4, 5, '2026-05-22 10:30:00', 'No pending charges', 1700000.00),
  (5, 5, 5, '2026-05-25 10:55:00', 'Customer requested receipt', 1450000.00);

INSERT INTO inventory.supplier (id, name, tax_id, phone, email, address)
VALUES
  (1, 'Fresh Foods Ltda', 'SUP900001001', '6015554001', 'ventas@freshfoods.example', 'Zona Industrial 1'),
  (2, 'CleanPro Services', 'SUP900001002', '6015554002', 'ventas@cleanpro.example', 'Zona Industrial 2'),
  (3, 'Comfort Textiles', 'SUP900001003', '6015554003', 'ventas@comforttextiles.example', 'Zona Industrial 3'),
  (4, 'MiniBar Express', 'SUP900001004', '6015554004', 'ventas@minibar.example', 'Zona Industrial 4'),
  (5, 'Wellness Supply', 'SUP900001005', '6015554005', 'ventas@wellness.example', 'Zona Industrial 5');

INSERT INTO inventory.product (id, supplier_id, name, description, sale_price, current_stock, minimum_stock)
VALUES
  (1, 1, 'Bottled Water', 'Still water 600 ml', 5000.00, 200, 30),
  (2, 4, 'Chocolate Bar', 'Mini bar chocolate bar', 8000.00, 120, 20),
  (3, 3, 'Extra Towel', 'Premium extra towel', 15000.00, 80, 10),
  (4, 2, 'Laundry Bag', 'Disposable laundry bag', 3000.00, 150, 25),
  (5, 5, 'Spa Kit', 'Personal wellness kit', 35000.00, 45, 8);

INSERT INTO inventory.service (id, name, description, sale_price, available)
VALUES
  (1, 'Breakfast Buffet', 'Daily breakfast buffet service', 45000.00, true),
  (2, 'Airport Transfer', 'One way airport transfer', 90000.00, true),
  (3, 'Laundry Service', 'Standard guest laundry service', 30000.00, true),
  (4, 'Spa Session', 'Relaxing spa session', 160000.00, true),
  (5, 'Late Checkout', 'Late checkout until 4 PM', 70000.00, true);

INSERT INTO inventory.product_tracking (id, product_id, movement_type, quantity, movement_at, note)
VALUES
  (1, 1, 'IN', 100, '2026-05-01 08:00:00', 'Initial bottled water stock'),
  (2, 2, 'IN', 60, '2026-05-01 08:10:00', 'Initial chocolate stock'),
  (3, 3, 'OUT', 10, '2026-05-01 08:20:00', 'Housekeeping usage'),
  (4, 4, 'IN', 80, '2026-05-01 08:30:00', 'Laundry bag restock'),
  (5, 5, 'OUT', 5, '2026-05-01 08:40:00', 'Spa package delivery');

INSERT INTO inventory.inventory_availability (id, product_id, service_id, available_quantity, available, note)
VALUES
  (1, 1, NULL, 200, true, 'Available for minibar'),
  (2, 2, NULL, 120, true, 'Available for minibar'),
  (3, 3, NULL, 80, true, 'Available for housekeeping'),
  (4, 4, NULL, 150, true, 'Available for laundry'),
  (5, 5, NULL, 45, true, 'Available for wellness packages');

INSERT INTO parameterization.payment_method (id, name, description, requires_reference, allows_partial_payment)
VALUES
  (1, 'Cash', 'Cash payment at front desk', false, true),
  (2, 'Credit Card', 'Credit card payment', true, true),
  (3, 'Bank Transfer', 'Bank transfer payment', true, true),
  (4, 'Digital Wallet', 'Digital wallet payment', true, true),
  (5, 'Voucher', 'Promotional or company voucher', true, false);

INSERT INTO service_delivery.product_sale (id, stay_id, product_id, quantity, unit_amount, total_amount)
VALUES
  (1, 1, 1, 2, 5000.00, 10000.00),
  (2, 2, 2, 3, 8000.00, 24000.00),
  (3, 3, 3, 1, 15000.00, 15000.00),
  (4, 4, 4, 4, 3000.00, 12000.00),
  (5, 5, 5, 1, 35000.00, 35000.00);

INSERT INTO service_delivery.service_sale (id, stay_id, service_id, quantity, unit_amount, total_amount)
VALUES
  (1, 1, 1, 2, 45000.00, 90000.00),
  (2, 2, 2, 1, 90000.00, 90000.00),
  (3, 3, 3, 1, 30000.00, 30000.00),
  (4, 4, 4, 2, 160000.00, 320000.00),
  (5, 5, 5, 1, 70000.00, 70000.00);

INSERT INTO billing.pre_invoice (id, stay_id, room_reservation_id, customer_id, subtotal, tax_amount, discount_amount, total)
VALUES
  (1, 1, 1, 1, 360000.00, 68400.00, 38400.00, 390000.00),
  (2, 2, 2, 2, 520000.00, 98800.00, 38800.00, 580000.00),
  (3, 3, 3, 3, 840000.00, 159600.00, 69600.00, 930000.00),
  (4, 4, 4, 4, 1560000.00, 296400.00, 156400.00, 1700000.00),
  (5, 5, 5, 5, 1300000.00, 247000.00, 97000.00, 1450000.00);

INSERT INTO billing.invoice (id, customer_id, stay_id, invoice_number, issued_at, subtotal, tax_amount, discount_amount, total, invoice_status)
VALUES
  (1, 1, 1, 'INV-2026-0001', '2026-05-12 11:00:00', 360000.00, 68400.00, 38400.00, 390000.00, 'ISSUED'),
  (2, 2, 2, 'INV-2026-0002', '2026-05-15 11:05:00', 520000.00, 98800.00, 38800.00, 580000.00, 'ISSUED'),
  (3, 3, 3, 'INV-2026-0003', '2026-05-18 11:10:00', 840000.00, 159600.00, 69600.00, 930000.00, 'ISSUED'),
  (4, 4, 4, 'INV-2026-0004', '2026-05-22 11:00:00', 1560000.00, 296400.00, 156400.00, 1700000.00, 'ISSUED'),
  (5, 5, 5, 'INV-2026-0005', '2026-05-25 11:15:00', 1300000.00, 247000.00, 97000.00, 1450000.00, 'ISSUED');

INSERT INTO billing.partial_payment (id, room_reservation_id, invoice_id, payment_method_id, amount, paid_at, payment_reference)
VALUES
  (1, 1, 1, 1, 390000.00, '2026-05-12 11:10:00', NULL),
  (2, 2, 2, 2, 300000.00, '2026-05-15 11:15:00', 'CARD-20260515-0002'),
  (3, 3, 3, 3, 500000.00, '2026-05-18 11:20:00', 'TRF-20260518-0003'),
  (4, 4, 4, 4, 850000.00, '2026-05-22 11:10:00', 'WALLET-20260522-0004'),
  (5, 5, 5, 5, 1450000.00, '2026-05-25 11:25:00', 'VOUCHER-20260525-0005');

INSERT INTO billing.purchase_detail (id, invoice_id, product_id, service_id, description, quantity, unit_amount, total_amount)
VALUES
  (1, 1, 1, NULL, 'Bottled water consumption', 2, 5000.00, 10000.00),
  (2, 2, NULL, 2, 'Airport transfer service', 1, 90000.00, 90000.00),
  (3, 3, 3, NULL, 'Extra towel charge', 1, 15000.00, 15000.00),
  (4, 4, NULL, 4, 'Spa session charge', 2, 160000.00, 320000.00),
  (5, 5, 5, NULL, 'Spa kit charge', 1, 35000.00, 35000.00);

INSERT INTO notification.promotion (id, title, description, start_date, end_date, channel, activa)
VALUES
  (1, 'Weekday Saver', 'Discount for weekday reservations', '2026-05-01 00:00:00', '2026-05-31 23:59:00', 'EMAIL', true),
  (2, 'Weekend Escape', 'Weekend package campaign', '2026-06-01 00:00:00', '2026-06-30 23:59:00', 'WEB', true),
  (3, 'Family Plan', 'Family room promotion', '2026-07-01 00:00:00', '2026-07-31 23:59:00', 'SOCIAL', true),
  (4, 'Business Stay', 'Business traveler offer', '2026-08-01 00:00:00', '2026-08-31 23:59:00', 'EMAIL', true),
  (5, 'Holiday Nights', 'Holiday season campaign', '2026-12-01 00:00:00', '2026-12-31 23:59:00', 'WEB', true);

INSERT INTO notification.alert (id, customer_id, room_reservation_id, title, mensaje, channel, sent_at)
VALUES
  (1, 1, 1, 'Reservation Confirmed', 'Your reservation has been confirmed.', 'EMAIL', '2026-05-01 09:00:00'),
  (2, 2, 2, 'Payment Reminder', 'Please complete your pending payment.', 'SMS', '2026-05-02 09:30:00'),
  (3, 3, 3, 'Check-in Reminder', 'Your check-in starts at 3 PM.', 'EMAIL', '2026-05-03 10:00:00'),
  (4, 4, 4, 'Cancellation Notice', 'Your reservation cancellation was registered.', 'EMAIL', '2026-05-04 10:30:00'),
  (5, 5, 5, 'Promotion Available', 'A new promotion is available for your next stay.', 'PUSH', '2026-05-05 11:00:00');

INSERT INTO notification.terms_condition (id, title, content, version, effective_date, mandatory)
VALUES
  (1, 'General Stay Terms', 'General terms for hotel stays.', '1.0.0', '2026-01-01', true),
  (2, 'Reservation Terms', 'Terms for room reservations.', '1.1.0', '2026-02-01', true),
  (3, 'Payment Terms', 'Terms for payments and refunds.', '1.2.0', '2026-03-01', true),
  (4, 'Privacy Terms', 'Terms for customer privacy.', '1.3.0', '2026-04-01', true),
  (5, 'Promotion Terms', 'Terms for promotions and vouchers.', '1.4.0', '2026-05-01', false);

INSERT INTO notification.customer_loyalty (id, customer_id, level, points, last_interaction_at, note)
VALUES
  (1, 1, 'BASIC', 120, '2026-05-01 09:00:00', 'New loyalty member'),
  (2, 2, 'SILVER', 520, '2026-05-02 09:30:00', 'Frequent weekend guest'),
  (3, 3, 'GOLD', 1250, '2026-05-03 10:00:00', 'Business traveler'),
  (4, 4, 'PLATINUM', 2500, '2026-05-04 10:30:00', 'International guest'),
  (5, 5, 'BASIC', 80, '2026-05-05 11:00:00', 'Promotion subscriber');

INSERT INTO maintenance.room_maintenance (id, room_id, employee_id, maintenance_type, start_date, end_date, maintenance_status, note)
VALUES
  (1, 1, 4, 'PREVENTIVE', '2026-05-02 08:00:00', '2026-05-02 10:00:00', 'COMPLETED', 'Air conditioning review'),
  (2, 2, 4, 'CORRECTIVE', '2026-05-03 09:00:00', '2026-05-03 12:00:00', 'COMPLETED', 'Door lock adjustment'),
  (3, 3, 4, 'INSPECTION', '2026-05-04 08:30:00', NULL, 'IN_PROGRESS', 'Suite inspection'),
  (4, 4, 4, 'REMODELING', '2026-05-05 07:00:00', NULL, 'PENDING', 'Family room refresh'),
  (5, 5, 4, 'CLEANING_SUPPORT', '2026-05-06 08:00:00', '2026-05-06 09:30:00', 'COMPLETED', 'Deep cleaning support');

INSERT INTO maintenance.maintenance_usage (id, room_maintenance_id, usage_reason, activity_detail)
VALUES
  (1, 1, 'Scheduled preventive task', 'Checked filters and ventilation'),
  (2, 2, 'Guest reported issue', 'Adjusted electronic lock'),
  (3, 3, 'Monthly inspection', 'Reviewed furniture and fixtures'),
  (4, 4, 'Room improvement plan', 'Prepared room for remodeling'),
  (5, 5, 'Cleaning support', 'Assisted with deep cleaning checklist');

INSERT INTO maintenance.maintenance_remodeling (id, room_maintenance_id, remodeling_description, estimated_budget)
VALUES
  (1, 1, 'Paint touch-up and minor fixture renewal', 250000.00),
  (2, 2, 'Door hardware replacement plan', 350000.00),
  (3, 3, 'Suite lighting improvement', 900000.00),
  (4, 4, 'Family room furniture refresh', 2500000.00),
  (5, 5, 'Deluxe room textile renewal', 1200000.00);

INSERT INTO maintenance.maintenance_dashboard (id, branch_id, total_rooms, available_rooms, occupied_rooms, maintenance_rooms, snapshot_at)
VALUES
  (1, 1, 20, 14, 5, 1, '2026-05-01 07:00:00'),
  (2, 2, 25, 18, 6, 1, '2026-05-01 07:05:00'),
  (3, 3, 30, 20, 8, 2, '2026-05-01 07:10:00'),
  (4, 4, 18, 10, 6, 2, '2026-05-01 07:15:00'),
  (5, 5, 22, 16, 5, 1, '2026-05-01 07:20:00');

SELECT setval(pg_get_serial_sequence('parameterization.customer', 'id'), (SELECT MAX(id) FROM parameterization.customer), true);
SELECT setval(pg_get_serial_sequence('security.person', 'id'), (SELECT MAX(id) FROM security.person), true);
SELECT setval(pg_get_serial_sequence('security.app_role', 'id'), (SELECT MAX(id) FROM security.app_role), true);
SELECT setval(pg_get_serial_sequence('security.permission', 'id'), (SELECT MAX(id) FROM security.permission), true);
SELECT setval(pg_get_serial_sequence('security.module', 'id'), (SELECT MAX(id) FROM security.module), true);
SELECT setval(pg_get_serial_sequence('security.screen', 'id'), (SELECT MAX(id) FROM security.screen), true);
SELECT setval(pg_get_serial_sequence('security.app_user', 'id'), (SELECT MAX(id) FROM security.app_user), true);
SELECT setval(pg_get_serial_sequence('security.app_user_role', 'id'), (SELECT MAX(id) FROM security.app_user_role), true);
SELECT setval(pg_get_serial_sequence('security.role_permission', 'id'), (SELECT MAX(id) FROM security.role_permission), true);
SELECT setval(pg_get_serial_sequence('security.module_screen', 'id'), (SELECT MAX(id) FROM security.module_screen), true);
SELECT setval(pg_get_serial_sequence('parameterization.company', 'id'), (SELECT MAX(id) FROM parameterization.company), true);
SELECT setval(pg_get_serial_sequence('parameterization.legal_information', 'id'), (SELECT MAX(id) FROM parameterization.legal_information), true);
SELECT setval(pg_get_serial_sequence('parameterization.employee', 'id'), (SELECT MAX(id) FROM parameterization.employee), true);
SELECT setval(pg_get_serial_sequence('distribution.branch', 'id'), (SELECT MAX(id) FROM distribution.branch), true);
SELECT setval(pg_get_serial_sequence('parameterization.day_type', 'id'), (SELECT MAX(id) FROM parameterization.day_type), true);
SELECT setval(pg_get_serial_sequence('distribution.room_type', 'id'), (SELECT MAX(id) FROM distribution.room_type), true);
SELECT setval(pg_get_serial_sequence('distribution.room_status', 'id'), (SELECT MAX(id) FROM distribution.room_status), true);
SELECT setval(pg_get_serial_sequence('distribution.room', 'id'), (SELECT MAX(id) FROM distribution.room), true);
SELECT setval(pg_get_serial_sequence('parameterization.price', 'id'), (SELECT MAX(id) FROM parameterization.price), true);
SELECT setval(pg_get_serial_sequence('service_delivery.room_reservation', 'id'), (SELECT MAX(id) FROM service_delivery.room_reservation), true);
SELECT setval(pg_get_serial_sequence('service_delivery.room_cancellation', 'id'), (SELECT MAX(id) FROM service_delivery.room_cancellation), true);
SELECT setval(pg_get_serial_sequence('service_delivery.room_availability', 'id'), (SELECT MAX(id) FROM service_delivery.room_availability), true);
SELECT setval(pg_get_serial_sequence('service_delivery.room_catalog', 'id'), (SELECT MAX(id) FROM service_delivery.room_catalog), true);
SELECT setval(pg_get_serial_sequence('service_delivery.stay', 'id'), (SELECT MAX(id) FROM service_delivery.stay), true);
SELECT setval(pg_get_serial_sequence('service_delivery.check_in', 'id'), (SELECT MAX(id) FROM service_delivery.check_in), true);
SELECT setval(pg_get_serial_sequence('service_delivery.check_out', 'id'), (SELECT MAX(id) FROM service_delivery.check_out), true);
SELECT setval(pg_get_serial_sequence('inventory.supplier', 'id'), (SELECT MAX(id) FROM inventory.supplier), true);
SELECT setval(pg_get_serial_sequence('inventory.product', 'id'), (SELECT MAX(id) FROM inventory.product), true);
SELECT setval(pg_get_serial_sequence('inventory.service', 'id'), (SELECT MAX(id) FROM inventory.service), true);
SELECT setval(pg_get_serial_sequence('inventory.product_tracking', 'id'), (SELECT MAX(id) FROM inventory.product_tracking), true);
SELECT setval(pg_get_serial_sequence('inventory.inventory_availability', 'id'), (SELECT MAX(id) FROM inventory.inventory_availability), true);
SELECT setval(pg_get_serial_sequence('parameterization.payment_method', 'id'), (SELECT MAX(id) FROM parameterization.payment_method), true);
SELECT setval(pg_get_serial_sequence('service_delivery.product_sale', 'id'), (SELECT MAX(id) FROM service_delivery.product_sale), true);
SELECT setval(pg_get_serial_sequence('service_delivery.service_sale', 'id'), (SELECT MAX(id) FROM service_delivery.service_sale), true);
SELECT setval(pg_get_serial_sequence('billing.pre_invoice', 'id'), (SELECT MAX(id) FROM billing.pre_invoice), true);
SELECT setval(pg_get_serial_sequence('billing.invoice', 'id'), (SELECT MAX(id) FROM billing.invoice), true);
SELECT setval(pg_get_serial_sequence('billing.partial_payment', 'id'), (SELECT MAX(id) FROM billing.partial_payment), true);
SELECT setval(pg_get_serial_sequence('billing.purchase_detail', 'id'), (SELECT MAX(id) FROM billing.purchase_detail), true);
SELECT setval(pg_get_serial_sequence('notification.promotion', 'id'), (SELECT MAX(id) FROM notification.promotion), true);
SELECT setval(pg_get_serial_sequence('notification.alert', 'id'), (SELECT MAX(id) FROM notification.alert), true);
SELECT setval(pg_get_serial_sequence('notification.terms_condition', 'id'), (SELECT MAX(id) FROM notification.terms_condition), true);
SELECT setval(pg_get_serial_sequence('notification.customer_loyalty', 'id'), (SELECT MAX(id) FROM notification.customer_loyalty), true);
SELECT setval(pg_get_serial_sequence('maintenance.room_maintenance', 'id'), (SELECT MAX(id) FROM maintenance.room_maintenance), true);
SELECT setval(pg_get_serial_sequence('maintenance.maintenance_usage', 'id'), (SELECT MAX(id) FROM maintenance.maintenance_usage), true);
SELECT setval(pg_get_serial_sequence('maintenance.maintenance_remodeling', 'id'), (SELECT MAX(id) FROM maintenance.maintenance_remodeling), true);
SELECT setval(pg_get_serial_sequence('maintenance.maintenance_dashboard', 'id'), (SELECT MAX(id) FROM maintenance.maintenance_dashboard), true);
