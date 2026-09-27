#!/usr/bin/env bash
# Deploys the committed HEAD to a Linux docker host under /opt/blog and restarts
# the container. nginx inside it serves the built site on 127.0.0.1:8001
# (network_mode host), which the platform nginx proxies for rchaves.app.
# Lives in bin/ because hexo loads every file under scripts/ as a plugin.
# Usage: bin/deploy.sh user@host
set -euo pipefail
HOST="${1:?usage: bin/deploy.sh user@host}"
DIR=/opt/blog

cd "$(dirname "$0")/.."
ssh "$HOST" "mkdir -p $DIR && find $DIR -mindepth 1 -maxdepth 1 -exec rm -rf {} +"
git archive --format=tar HEAD | ssh "$HOST" "tar -x -C $DIR"
ssh "$HOST" "cd $DIR && docker compose -p blog up -d --build && docker image prune -f >/dev/null"
ssh "$HOST" "for i in \$(seq 1 30); do curl -fsS -o /dev/null http://127.0.0.1:8001/ && echo healthy && exit 0; sleep 2; done; docker logs --tail 50 blog-app-1; exit 1"
