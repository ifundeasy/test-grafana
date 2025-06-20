#!/bin/bash

NAMESPACE="monitoring"
PYROSCOPE_DIR=monitoring/pyroscope

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying Pyroscope..."
  cd "$PYROSCOPE_DIR" || exit 1
  kubectl apply -f secrets.yaml --namespace "$NAMESPACE"
  helm upgrade --install --values values.yaml ps grafana/pyroscope --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Pyroscope installed in namespace '$NAMESPACE'."
elif [ "$1" == "uninstall" ]; then
  echo "[x] Uninstalling Pyroscope..."
  helm uninstall ps --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Pyroscope removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
