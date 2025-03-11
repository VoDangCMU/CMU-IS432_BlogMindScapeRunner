create database blog_mindscape_production;

CREATE USER template_user WITH PASSWORD '12345678';
GRANT ALL PRIVILEGES ON DATABASE blog_mindscape_production to template_user;
GRANT pg_read_all_data TO template_user;
GRANT pg_write_all_data TO template_user;
GRANT ALL ON SCHEMA public TO template_user;

ALTER DATABASE blog_mindscape_production OWNER TO template_user;