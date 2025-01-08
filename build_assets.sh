#!/bin/sh
docker compose up -d node
docker compose exec node npm run build
cp node/src/dist/* django/src/core/static/core/assets
rm -r ../tziallas.net_static/tidy/*
cp -R django/src/core/static/core/* ../tziallas.net_static/tidy
