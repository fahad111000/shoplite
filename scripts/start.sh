#!/bin/bash

set -e


echo "Starting shoplite containers..."

docker start shoplite-postgres
docker start shoplite-catalog
docker start shoplite-inventory
docker start shoplite-orders
docker start shoplite-frontend
echo "All ShopLite containers started!"

docker ps

