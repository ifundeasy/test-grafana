#!/bin/bash

NAMESPACE="grafana"
ALLOY_DIR=~/Developer/test-grafana/production/2-grafana/0-alloy
GRAFANA_DIR=~/Developer/test-grafana/production/2-grafana/1-grafana

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying Grafana Alloy..."
  cd "$ALLOY_DIR" || exit 1
  helm upgrade --install --values values.yaml al-grafana grafana/alloy --namespace "$NAMESPACE"
  echo ""
  echo "[+] Deploying Grafana..."
  cd "$GRAFANA_DIR" || exit 1
  kubectl apply -f secrets.yaml --namespace "$NAMESPACE"
  helm upgrade --install --values values.yaml gf grafana/grafana --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Grafana stack installed."

elif [ "$1" == "uninstall" ]; then
  echo "[x] Uninstalling Grafana..."
  helm uninstall gf --namespace "$NAMESPACE"
  echo ""
  echo "[x] Uninstalling Grafana Alloy..."
  helm uninstall al-grafana --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Grafana stack removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
