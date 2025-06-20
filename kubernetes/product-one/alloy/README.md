# monitoring/alloy
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/alloy`

## install
```bash
cd kubernetes/product-one/alloy
helm search repo grafana/alloy
kubectl create namespace product-one || true
kubectl apply -f secrets.yaml --namespace product-one
helm upgrade --install --values values.yaml al-product-one grafana/alloy --namespace product-one
```

## debug

### default values from chart
```bash
cd kubernetes/product-one/alloy
mkdir original
helm show values grafana/alloy > ./original/values.yaml
helm template al-product-one grafana/alloy --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
cd kubernetes/product-one/alloy
mkdir debug
helm get values al-product-one --namespace product-one -o yaml > ./debug/values.yaml
helm get values al-product-one --namespace product-one --all -o yaml > ./debug/all-values.yaml
helm template al-product-one grafana/alloy --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash product-one
cd kubernetes/product-one/alloy
helm uninstall al-product-one --namespace product-one
kubectl delete -f secrets.yaml --namespace product-one
```