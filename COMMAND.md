# COMMAND.md

## INSTALL
```bash
# cluster: creation
cd ~/Developer/test-grafana/production/1-cluster
kind create cluster --name locale --config config.yaml
kubectl config use-context kind-locale
kubectl config current-context
kubectl get pods -n kube-system
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl -n kube-system describe deployment metrics-server
kubectl -n kube-system patch deployment metrics-server \
  --type=json \
  -p='[
    { "op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls" }
  ]'
kubectl -n kube-system describe deployment metrics-server

# alloy grafana: creation
cd ~/Developer/test-grafana/production/2-grafana/0-alloy
kubectl create namespace grafana || true
helm upgrade --install --values values.yaml al-grafana grafana/alloy --namespace grafana

# grafana: creation
cd ~/Developer/test-grafana/production/2-grafana/1-grafana
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml gf grafana/grafana --namespace grafana

# loki: creation
cd ~/Developer/test-grafana/production/2-grafana/2-loki
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml lk grafana/loki --namespace grafana

# tempo: creation
cd ~/Developer/test-grafana/production/2-grafana/3-tempo
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml tp grafana/tempo-distributed --namespace grafana

# mimir: creation
cd ~/Developer/test-grafana/production/2-grafana/4-mimir
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml mr grafana/mimir-distributed --namespace grafana

# alloy product-one: creation
cd ~/Developer/test-grafana/production/product-one/0-alloy
kubectl create namespace product-one || true
helm upgrade --install --values values.yaml al-product-one grafana/alloy --namespace product-one

# simple crud product-one: creation
cd ~/Developer/test-grafana/production/product-one
kubectl create namespace product-one || true
kubectl apply -f simple-crud --namespace product-one

# alloy product-two: creation
cd ~/Developer/test-grafana/production/product-two/0-alloy
kubectl create namespace product-two || true
helm upgrade --install --values values.yaml al-product-two grafana/alloy --namespace product-two

# simple crud product-two: creation
cd ~/Developer/test-grafana/production/product-two
kubectl create namespace product-two || true
kubectl apply -f simple-crud --namespace product-two
```

## UNINSTALL
```bash
# alloy grafana: deletion
cd ~/Developer/test-grafana/production/2-grafana/0-alloy
helm uninstall al-grafana --namespace grafana

# grafana: deletion
cd ~/Developer/test-grafana/production/2-grafana/1-grafana
helm uninstall gf --namespace grafana

# loki: deletion
cd ~/Developer/test-grafana/production/2-grafana/2-loki
helm uninstall lk --namespace grafana

# tempo: deletion
cd ~/Developer/test-grafana/production/2-grafana/3-tempo
helm uninstall tp --namespace grafana

# mimir: deletion
cd ~/Developer/test-grafana/production/2-grafana/4-mimir
helm uninstall mr --namespace grafana

# alloy product-one: deletion
cd ~/Developer/test-grafana/production/product-one/0-alloy
helm uninstall al-product-one --namespace product-one

# simple crud product-one: deletion
cd ~/Developer/test-grafana/production/product-one
kubectl delete -f simple-crud --namespace product-one

# alloy product-two: deletion
cd ~/Developer/test-grafana/production/product-two/0-alloy
helm uninstall al-product-two --namespace product-two

# simple crud product-two: deletion
cd ~/Developer/test-grafana/production/product-two
kubectl delete -f simple-crud --namespace product-two

# namespace: deletion
kubectl delete namespace product-two
kubectl delete namespace product-one
kubectl delete namespace grafana

# cluster: deletion
kind delete cluster --name locale
```