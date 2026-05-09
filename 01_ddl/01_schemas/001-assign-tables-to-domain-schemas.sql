ALTER TABLE IF EXISTS public.customer SET SCHEMA parameterization;
ALTER TABLE IF EXISTS public.price SET SCHEMA parameterization;
ALTER TABLE IF EXISTS public.company SET SCHEMA parameterization;
ALTER TABLE IF EXISTS public.legal_information SET SCHEMA parameterization;
ALTER TABLE IF EXISTS public.employee SET SCHEMA parameterization;
ALTER TABLE IF EXISTS public.day_type SET SCHEMA parameterization;
ALTER TABLE IF EXISTS public.payment_method SET SCHEMA parameterization;

ALTER TABLE IF EXISTS public.branch SET SCHEMA distribution;
ALTER TABLE IF EXISTS public.room SET SCHEMA distribution;
ALTER TABLE IF EXISTS public.room_type SET SCHEMA distribution;
ALTER TABLE IF EXISTS public.room_status SET SCHEMA distribution;

ALTER TABLE IF EXISTS public.room_reservation SET SCHEMA service_delivery;
ALTER TABLE IF EXISTS public.room_cancellation SET SCHEMA service_delivery;
ALTER TABLE IF EXISTS public.room_availability SET SCHEMA service_delivery;
ALTER TABLE IF EXISTS public.room_catalog SET SCHEMA service_delivery;
ALTER TABLE IF EXISTS public.check_in SET SCHEMA service_delivery;
ALTER TABLE IF EXISTS public.check_out SET SCHEMA service_delivery;
ALTER TABLE IF EXISTS public.stay SET SCHEMA service_delivery;
ALTER TABLE IF EXISTS public.product_sale SET SCHEMA service_delivery;
ALTER TABLE IF EXISTS public.service_sale SET SCHEMA service_delivery;

ALTER TABLE IF EXISTS public.pre_invoice SET SCHEMA billing;
ALTER TABLE IF EXISTS public.partial_payment SET SCHEMA billing;
ALTER TABLE IF EXISTS public.invoice SET SCHEMA billing;
ALTER TABLE IF EXISTS public.purchase_detail SET SCHEMA billing;

ALTER TABLE IF EXISTS public.product SET SCHEMA inventory;
ALTER TABLE IF EXISTS public.service SET SCHEMA inventory;
ALTER TABLE IF EXISTS public.supplier SET SCHEMA inventory;
ALTER TABLE IF EXISTS public.product_tracking SET SCHEMA inventory;
ALTER TABLE IF EXISTS public.inventory_availability SET SCHEMA inventory;

ALTER TABLE IF EXISTS public.promotion SET SCHEMA notification;
ALTER TABLE IF EXISTS public.alert SET SCHEMA notification;
ALTER TABLE IF EXISTS public.terms_condition SET SCHEMA notification;
ALTER TABLE IF EXISTS public.customer_loyalty SET SCHEMA notification;

ALTER TABLE IF EXISTS public.person SET SCHEMA security;
ALTER TABLE IF EXISTS public.app_user SET SCHEMA security;
ALTER TABLE IF EXISTS public.app_role SET SCHEMA security;
ALTER TABLE IF EXISTS public.permission SET SCHEMA security;
ALTER TABLE IF EXISTS public.module SET SCHEMA security;
ALTER TABLE IF EXISTS public.screen SET SCHEMA security;
ALTER TABLE IF EXISTS public.app_user_role SET SCHEMA security;
ALTER TABLE IF EXISTS public.role_permission SET SCHEMA security;
ALTER TABLE IF EXISTS public.module_screen SET SCHEMA security;

ALTER TABLE IF EXISTS public.room_maintenance SET SCHEMA maintenance;
ALTER TABLE IF EXISTS public.maintenance_usage SET SCHEMA maintenance;
ALTER TABLE IF EXISTS public.maintenance_remodeling SET SCHEMA maintenance;
ALTER TABLE IF EXISTS public.maintenance_dashboard SET SCHEMA maintenance;
