#!/bin/bash

NAMESPACE="monitoring"
ALLOY_DIR=monitoring/alloy

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying Grafana Alloy..."
  cd "$ALLOY_DIR" || exit 1
  helm upgrade --install --values values.yaml al-grafana grafana/alloy --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Alloy for Grafana stack installed."

elif [ "$1" == "uninstall" ]; then
  echo "[x] Uninstalling Grafana Alloy..."
  helm uninstall al-grafana --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Alloy for Grafana stack removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
