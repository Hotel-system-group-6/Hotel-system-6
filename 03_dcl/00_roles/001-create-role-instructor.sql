-- Permission roles para el instru
CREATE ROLE role_instructor NOLOGIN;
CREATE ROLE ariel5253 LOGIN INHERIT PASSWORD 'ariel5253';
GRANT role_instructor TO ariel5253;
