-- MAINTENANCE: maintenance_dashboard
ALTER TABLE maintenance_dashboard
ADD CONSTRAINT fk_maintenance_dashboard_branch FOREIGN KEY (branch_id) REFERENCES branch (id);
