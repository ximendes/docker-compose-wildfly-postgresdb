#!/bin/bash
set -e

echo "Create user and database"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker WITH ENCRYPTED PASSWORD 'docker';
    CREATE DATABASE my_db;
    GRANT ALL PRIVILEGES ON DATABASE my_db TO docker;
EOSQL

echo "Restoring backup..."
pg_restore --username=postgres --dbname=my_db --jobs=4 --no-privileges /tmp/backup/dump-my_db.backup

echo "Executing initial script"
psql -v ON_ERROR_STOP=1 --username=postgres --dbname=my_db --file=/tmp/backup/script-inicial.sql

