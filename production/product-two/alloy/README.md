# grafana/alloy
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/alloy`

## install
```bash
cd production/product-two/alloy
helm search repo grafana/alloy
kubectl create namespace product-two || true
kubectl apply -f secrets.yaml --namespace product-two
helm upgrade --install --values values.yaml lloya-product-two grafana/alloy --namespace product-two
```

## debug

### default values from chart
```bash
cd production/product-two/alloy
mkdir original
helm show values grafana/alloy > ./original/values.yaml
helm template lloya-product-two grafana/alloy --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
cd production/product-two/alloy
mkdir debug
helm get values lloya-product-two --namespace product-two -o yaml > ./debug/values.yaml
helm get values lloya-product-two --namespace product-two --all -o yaml > ./debug/all-values.yaml
helm template lloya-product-two grafana/alloy --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall lloya-product-two --namespace product-two
cd production/product-two/alloy
kubectl delete -f secrets.yaml --namespace product-two
```