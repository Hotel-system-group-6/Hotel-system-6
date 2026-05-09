-- PARAMETERIZATION: legal_information
ALTER TABLE legal_information
ADD CONSTRAINT fk_legal_information_company FOREIGN KEY (company_id) REFERENCES company (id) ON DELETE RESTRICT;
