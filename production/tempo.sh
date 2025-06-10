#!/bin/bash

NAMESPACE="grafana"
TEMPO_DIR=~/Developer/test-grafana/production/2-grafana/3-tempo

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying Tempo..."
  cd "$TEMPO_DIR" || exit 1
  kubectl apply -f secrets.yaml --namespace "$NAMESPACE"
  helm upgrade --install --values values.yaml tp grafana/tempo-distributed --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Tempo installed in namespace '$NAMESPACE'."
elif [ "$1" == "uninstall" ]; then
  echo "[x] Uninstalling Tempo..."
  helm uninstall tp --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Tempo removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
