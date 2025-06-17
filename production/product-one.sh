#!/bin/bash

NAMESPACE="grafana"
ALLOY_DIR=~/Developer/test-grafana/production/product-one/0-alloy
SIMPLE_CRUD_DIR=~/Developer/test-grafana/production/product-one

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying simple-crud app..."
  cd "$SIMPLE_CRUD_DIR" || exit 1
  kubectl apply -f simple-crud --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Alloy + simple-crud deployed in namespace '$NAMESPACE'."
elif [ "$1" == "uninstall" ]; then
  echo "[x] Deleting simple-crud app..."
  cd "$SIMPLE_CRUD_DIR" || exit 1
  kubectl delete -f simple-crud --namespace "$NAMESPACE" --ignore-not-found
  echo ""
  echo "[✓] product-one resources removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
