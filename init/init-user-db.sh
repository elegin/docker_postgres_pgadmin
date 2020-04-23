#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER viewer;
    CREATE DATABASE viewer;
    GRANT ALL PRIVILEGES ON DATABASE viewer TO viewer;     
EOSQL
cat /pgdump | psql  -Upostgres -d viewer