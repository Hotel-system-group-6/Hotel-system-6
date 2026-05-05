CREATE TRIGGER trg_customer_set_updated_at
BEFORE UPDATE ON customer
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_person_set_updated_at
BEFORE UPDATE ON person
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_app_role_set_updated_at
BEFORE UPDATE ON app_role
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_permission_set_updated_at
BEFORE UPDATE ON permission
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_module_set_updated_at
BEFORE UPDATE ON module
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_screen_set_updated_at
BEFORE UPDATE ON screen
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_app_user_set_updated_at
BEFORE UPDATE ON app_user
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_company_set_updated_at
BEFORE UPDATE ON company
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_day_type_set_updated_at
BEFORE UPDATE ON day_type
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_payment_method_set_updated_at
BEFORE UPDATE ON payment_method
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_legal_information_set_updated_at
BEFORE UPDATE ON legal_information
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_employee_set_updated_at
BEFORE UPDATE ON employee
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_branch_set_updated_at
BEFORE UPDATE ON branch
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_room_type_set_updated_at
BEFORE UPDATE ON room_type
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_room_status_set_updated_at
BEFORE UPDATE ON room_status
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_room_set_updated_at
BEFORE UPDATE ON room
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_price_set_updated_at
BEFORE UPDATE ON price
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_room_reservation_set_updated_at
BEFORE UPDATE ON room_reservation
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_room_cancellation_set_updated_at
BEFORE UPDATE ON room_cancellation
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_room_availability_set_updated_at
BEFORE UPDATE ON room_availability
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_room_catalog_set_updated_at
BEFORE UPDATE ON room_catalog
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_stay_set_updated_at
BEFORE UPDATE ON stay
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_check_in_set_updated_at
BEFORE UPDATE ON check_in
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_check_out_set_updated_at
BEFORE UPDATE ON check_out
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_supplier_set_updated_at
BEFORE UPDATE ON supplier
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_product_set_updated_at
BEFORE UPDATE ON product
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_service_set_updated_at
BEFORE UPDATE ON service
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_product_sale_set_updated_at
BEFORE UPDATE ON product_sale
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_service_sale_set_updated_at
BEFORE UPDATE ON service_sale
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_pre_invoice_set_updated_at
BEFORE UPDATE ON pre_invoice
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_invoice_set_updated_at
BEFORE UPDATE ON invoice
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_partial_payment_set_updated_at
BEFORE UPDATE ON partial_payment
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_purchase_detail_set_updated_at
BEFORE UPDATE ON purchase_detail
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_product_tracking_set_updated_at
BEFORE UPDATE ON product_tracking
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_inventory_availability_set_updated_at
BEFORE UPDATE ON inventory_availability
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_promotion_set_updated_at
BEFORE UPDATE ON promotion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_alert_set_updated_at
BEFORE UPDATE ON alert
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_terms_condition_set_updated_at
BEFORE UPDATE ON terms_condition
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_customer_loyalty_set_updated_at
BEFORE UPDATE ON customer_loyalty
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_room_maintenance_set_updated_at
BEFORE UPDATE ON room_maintenance
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_maintenance_usage_set_updated_at
BEFORE UPDATE ON maintenance_usage
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_maintenance_remodeling_set_updated_at
BEFORE UPDATE ON maintenance_remodeling
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_maintenance_dashboard_set_updated_at
BEFORE UPDATE ON maintenance_dashboard
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_app_user_role_set_updated_at
BEFORE UPDATE ON app_user_role
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_role_permission_set_updated_at
BEFORE UPDATE ON role_permission
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_module_screen_set_updated_at
BEFORE UPDATE ON module_screen
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();



