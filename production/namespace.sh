#!/bin/bash

GRAFANA_NAMESPACE="grafana"
PRODUCT_ONE_NAMESPACE="product-one"
PRODUCT_TWO_NAMESPACE="product-two"
ALLOY_DIR=~/Developer/test-grafana/production/2-grafana/0-alloy
GRAFANA_DIR=~/Developer/test-grafana/production/2-grafana/1-grafana

if [ "$1" == "install" ]; then
  echo "[+] Creating namespace: $GRAFANA_NAMESPACE (if not exists)"
  kubectl create namespace "$GRAFANA_NAMESPACE" || true
  echo "[✓] $GRAFANA_NAMESPACE namespace stack installed."
  echo ""
  echo "[+] Creating namespace: $PRODUCT_ONE_NAMESPACE (if not exists)"
  kubectl create namespace "$PRODUCT_ONE_NAMESPACE" || true
  echo "[✓] $PRODUCT_ONE_NAMESPACE namespace stack installed."
  echo ""
  echo "[+] Creating namespace: $PRODUCT_TWO_NAMESPACE (if not exists)"
  kubectl create namespace "$PRODUCT_TWO_NAMESPACE" || true
  echo "[✓] $PRODUCT_TWO_NAMESPACE namespace stack installed."
elif [ "$1" == "uninstall" ]; then
  echo "[x] Deleting namespace: $GRAFANA_NAMESPACE"
  kubectl delete namespace "$GRAFANA_NAMESPACE" --ignore-not-found
  echo "[✓] $GRAFANA_NAMESPACE namespace stack removed."
  echo ""
  echo "[x] Deleting namespace: $PRODUCT_ONE_NAMESPACE"
  kubectl delete namespace "$PRODUCT_ONE_NAMESPACE" --ignore-not-found
  echo "[✓] $PRODUCT_ONE_NAMESPACE namespace stack removed."
  echo ""
  echo "[x] Deleting namespace: $PRODUCT_TWO_NAMESPACE"
  kubectl delete namespace "$PRODUCT_TWO_NAMESPACE" --ignore-not-found
  echo "[✓] $PRODUCT_TWO_NAMESPACE namespace stack removed."
else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
