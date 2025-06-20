#!/bin/bash

NAMESPACE="monitoring"
MIMIR_DIR=monitoring/mimir

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying Mimir..."
  cd "$MIMIR_DIR" || exit 1
  kubectl apply -f secrets.yaml --namespace "$NAMESPACE"
  helm upgrade --install --values values.yaml mr grafana/mimir-distributed --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Mimir installed in namespace '$NAMESPACE'."

elif [ "$1" == "uninstall" ]; then
  echo "[x] Uninstalling Mimir..."
  helm uninstall mr --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Mimir removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
