
#!/bin/bash

echo "Stopping ShopLite containers..."

docker stop shoplite-frontend
docker stop shoplite-orders
docker stop shoplite-inventory
docker stop shoplite-catalog
docker stop shoplite-postgres

echo "All ShopLite containers stopped!"

docker ps

