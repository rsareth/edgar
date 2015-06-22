#/bin/bash

set -e

docker run --name edgar-app \
        --link edgar-postgres:postgres \
        -e EDGAR_DB_PASSWORD=merciedgar \
        -p 3000:3000 \
        -v $PWD:/var/rails/edgar/ \
        -d rsareth/edgar
