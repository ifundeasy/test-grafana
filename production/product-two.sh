#!/bin/bash

NAMESPACE="product-two"
ALLOY_DIR=~/Developer/test-grafana/production/product-two/0-alloy
SIMPLE_CRUD_DIR=~/Developer/test-grafana/production/product-two

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying Grafana Alloy for product-two..."
  cd "$ALLOY_DIR" || exit 1
  helm upgrade --install --values values.yaml al-product-two grafana/alloy --namespace "$NAMESPACE"
  echo ""
  echo "[+] Deploying simple-crud app..."
  cd "$SIMPLE_CRUD_DIR" || exit 1
  kubectl apply -f simple-crud --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Alloy + simple-crud deployed in namespace '$NAMESPACE'."
elif [ "$1" == "uninstall" ]; then
  echo "[x] Uninstalling Grafana Alloy for product-two..."
  helm uninstall al-product-two --namespace "$NAMESPACE"
  echo ""
  echo "[x] Deleting simple-crud app..."
  cd "$SIMPLE_CRUD_DIR" || exit 1
  kubectl delete -f simple-crud --namespace "$NAMESPACE" --ignore-not-found
  echo "[✓] product-two resources removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
