#!/bin/bash

NAMESPACE="product-one"
ALLOY_DIR=product-one/alloy
SIMPLE_CRUD_DIR=product-one

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $NAMESPACE (if not exists)"
  kubectl create namespace "$NAMESPACE" || true
  echo ""
  echo "[+] Deploying Grafana Alloy for product-one..."
  cd "$ALLOY_DIR" || exit 1
  helm upgrade --install --values values.yaml al-product-one grafana/alloy --namespace "$NAMESPACE"
  echo ""
  echo "[+] Deploying simple-crud app..."
  cd "$SIMPLE_CRUD_DIR" || exit 1
  kubectl apply -f simple-crud --namespace "$NAMESPACE"
  echo ""
  echo "[✓] Alloy + simple-crud deployed in namespace '$NAMESPACE'."
elif [ "$1" == "uninstall" ]; then
  echo "[x] Uninstalling Grafana Alloy for product-one..."
  helm uninstall al-product-one --namespace "$NAMESPACE"
  echo ""
  echo "[x] Deleting simple-crud app..."
  cd "$SIMPLE_CRUD_DIR" || exit 1
  kubectl delete -f simple-crud --namespace "$NAMESPACE" --ignore-not-found
  echo ""
  echo "[✓] product-one resources removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
