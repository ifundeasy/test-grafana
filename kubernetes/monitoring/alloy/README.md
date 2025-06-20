# monitoring/alloy
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/alloy`

## install
```bash
cd kubernetes/monitoring/alloy
helm search repo grafana/alloy
kubectl create namespace monitoring || true
kubectl apply -f secrets.yaml --namespace monitoring
helm upgrade --install --values values.yaml al grafana/alloy --namespace monitoring
```

## debug

### default values from chart
```bash
cd kubernetes/monitoring/alloy
helm show values grafana/alloy > ./values-documentation.yaml
```

### current values from chart
```bash
cd kubernetes/monitoring/alloy
mkdir debug
helm get values al --namespace monitoring -o yaml > ./debug/values.yaml
helm get values al --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template al grafana/alloy --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd kubernetes/monitoring/alloy
helm uninstall al --namespace monitoring
kubectl delete -f secrets.yaml --namespace monitoring
```