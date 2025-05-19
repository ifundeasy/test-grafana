# grafana/alloy
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/alloy`

## install
```bash
cd production/product-two/0-alloy
helm search repo grafana/alloy
kubectl create namespace product-two || true
kubectl apply -f secrets.yaml --namespace product-two
helm upgrade --install --values values.yaml al-product-two grafana/alloy --namespace product-two
```

## debug

### default values from chart
```bash
cd production/product-two/0-alloy
mkdir original
helm show values grafana/alloy > ./original/values.yaml
helm template al-product-two grafana/alloy --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
cd production/product-two/0-alloy
mkdir debug
helm get values al-product-two --namespace product-two -o yaml > ./debug/values.yaml
helm get values al-product-two --namespace product-two --all -o yaml > ./debug/all-values.yaml
helm template al-product-two grafana/alloy --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd production/product-two/0-alloy
helm uninstall al-product-two --namespace product-two
kubectl delete -f secrets.yaml --namespace product-two
```