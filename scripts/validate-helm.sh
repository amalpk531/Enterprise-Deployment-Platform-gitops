#!/bin/bash
set -e

echo "Rendering Helm chart with dev values..."
helm template helm/enterprise-app -f helm/enterprise-app/values.yaml

echo ""
echo "Rendering Helm chart with prod values..."
helm template helm/enterprise-app -f helm/enterprise-app/values-prod.yaml

echo ""
echo "Helm chart validation complete."
