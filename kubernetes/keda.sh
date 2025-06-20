#!/bin/bash

NAMESPACE="monitoring"
KEDA_DIR=monitoring/keda

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying Keda..."
  cd "$KEDA_DIR" || exit 1
  kubectl apply -f secrets.yaml --namespace "$NAMESPACE"
  helm upgrade --install --values values.yaml kd kedacore/keda --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Keda installed."

elif [ "$1" == "uninstall" ]; then
  echo "[x] Uninstalling Keda..."
  helm uninstall kd --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Keda stack removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
