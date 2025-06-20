#!/bin/bash

NAMESPACE="monitoring"
LOKI_DIR=monitoring/loki

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying Loki..."
  cd "$LOKI_DIR" || exit 1
  kubectl apply -f secrets.yaml --namespace "$NAMESPACE"
  helm upgrade --install --values values.yaml lk grafana/loki --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Loki installed in namespace '$NAMESPACE'."

elif [ "$1" == "uninstall" ]; then
  echo "[x] Uninstalling Loki..."
  helm uninstall lk --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Loki removed."

else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
