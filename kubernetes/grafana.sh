#!/bin/bash

NAMESPACE="monitoring"
GRAFANA_DIR=monitoring/grafana

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying Grafana..."
  cd "$GRAFANA_DIR" || exit 1
  kubectl apply -f secrets.yaml --namespace "$NAMESPACE"
  helm upgrade --install --values values.yaml gf grafana/grafana --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Grafana installed."

elif [ "$1" == "uninstall" ]; then
  echo "[x] Uninstalling Grafana..."
  helm uninstall gf --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Grafana stack removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
