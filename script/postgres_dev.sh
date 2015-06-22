#/bin/bash

set -e

EDGAR_DB_NAME=merciedgar
EDGAR_DB_USER=merciedgar
EDGAR_DB_PASSWORD=merciedgar

echo "Running PostgreSQL Container ..."
docker run \
        --name edgar-postgres \
        -e POSTGRES_DB=${EDGAR_DB_NAME} \
        -e POSTGRES_USER=${EDGAR_DB_USER} \
        -e POSTGRES_PASSWORD=${EDGAR_DB_PASSWORD} \
        -d postgres:9.4
