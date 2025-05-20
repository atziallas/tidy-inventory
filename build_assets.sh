#!/bin/sh
docker compose up -d node
docker compose exec node npm run build
cp node/src/dist/* django/src/core/static/core/assets

# when using a separate static site deployment
# rm -r ../tziallas.net_static/tidy/*
# cp -R django/src/core/static/ ../tziallas.net-static/static/tidy
