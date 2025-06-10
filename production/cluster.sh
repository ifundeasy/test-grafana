#!/bin/bash

CLUSTER_NAME="locale"
KIND_CONFIG="~/Developer/test-grafana/production/1-cluster/config.yaml"
METRICS_SERVER_URL="https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml"

if [ "$1" == "install" ]; then
  echo "[+] Creating Kind cluster: $CLUSTER_NAME"
  kind create cluster --name "$CLUSTER_NAME" --config "$KIND_CONFIG"

  echo "[+] Switching context to kind-$CLUSTER_NAME"
  kubectl config use-context "kind-$CLUSTER_NAME"

  echo "[+] Verifying cluster is up"
  kubectl get pods -n kube-system

  echo "[+] Installing metrics-server"
  kubectl apply -f "$METRICS_SERVER_URL"

  echo "[+] Patching metrics-server with --kubelet-insecure-tls"
  kubectl -n kube-system patch deployment metrics-server \
    --type=json \
    -p='[
      { "op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls" }
    ]'

  echo "[✓] Kind cluster '$CLUSTER_NAME' with metrics-server is ready."

elif [ "$1" == "uninstall" ]; then
  echo "[x] Deleting Kind cluster: $CLUSTER_NAME"
  kind delete cluster --name "$CLUSTER_NAME"

  echo "[✓] Cluster deleted."

else
  echo "Usage: $0 [install|uninstall]"
  exit 1
fi
