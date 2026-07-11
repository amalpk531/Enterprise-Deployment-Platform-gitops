#!/bin/bash
set -e

# Deploy to dev environment via Docker Compose
# Usage: ./scripts/deploy-dev.sh <image-tag>

IMAGE_TAG=${1:-latest}
DEV_HOST=${DEV_HOST:-REPLACE_DEV_DEPLOY_IP}
DEV_USER=${DEV_USER:-ubuntu}

echo "Deploying image tag ${IMAGE_TAG} to dev server ${DEV_HOST}..."

ssh -o StrictHostKeyChecking=no ${DEV_USER}@${DEV_HOST} \
  "cd /opt/enterprise-app && \
   IMAGE_TAG=${IMAGE_TAG} docker compose -f docker-compose.dev.yml pull && \
   IMAGE_TAG=${IMAGE_TAG} docker compose -f docker-compose.dev.yml up -d"

echo "Dev deployment complete."
