-- db/changelog/sql/002-no-authen-access-urls.sql

-- Liquibase formatted SQL

-- ChangeSet
-- ChangeSet author: Trung Doan
-- ChangeSet id: 002

INSERT INTO anonymous_url_access (id) VALUES ('/') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/parserConfigurationException') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/error') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/swagger-ui.html') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/favicon.ico') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/swagger-ui/*') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/v3/api-docs') ON CONFLICT DO NOTHING;
INSERT INTO anonymous_url_access (id) VALUES ('/v3/api-docs/*') ON CONFLICT DO NOTHING;

-- /ChangeSet