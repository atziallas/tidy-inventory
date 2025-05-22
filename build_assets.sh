#!/bin/sh
docker compose up -d node
docker compose exec node npm run build
cp node/src/dist/* django/src/static/core/assets

# when using the deploy.yml inside nginx-static folder
# cp -R django/src/core/static/core nginx-static/tidy

# when using separate static site deployment for all tziallas.net subdomains
rm -rf ../tziallas.net-static/static/tidy
cp -R django/src/static/ ../tziallas.net-static/static/tidy
