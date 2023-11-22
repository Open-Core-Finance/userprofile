-- Liquibase formatted SQL
-- ChangeSet Trung.Doan:2 labels:anonymous_url_data runOnChange:true

INSERT INTO anonymous_url_access (id) VALUES ('/') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/parserConfigurationException') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/error') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/swagger-ui.html') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/favicon.ico') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/swagger-ui/*') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/v3/api-docs') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/v3/api-docs/*') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/actuator') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/actuator/*') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/index') ON CONFLICT DO NOTHING;
