CREATE ROLE bigdata_user WITH LOGIN PASSWORD 'ownerpassword' NOSUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION;
CREATE ROLE bg WITH NOLOGIN;

create schema bigdata AUTHORIZATION bigdata_user;
GRANT ALL ON SCHEMA bigdata to bigdata_user;
grant usage on schema bigdata to bigdata_user;
ALTER ROLE bigdata_user SET search_path TO bigdata,pg_catalog,public;

CREATE USER bigdata_app WITH LOGIN PASSWORD 'apppassword' NOSUPERUSER INHERIT NOREPLICATION;
GRANT USAGE ON SCHEMA bigdata to bigdata_app;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";