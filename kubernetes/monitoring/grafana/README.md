# monitoring/grafana
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/grafana`

## install
```bash
cd kubernetes/monitoring/grafana
helm search repo grafana/grafana
kubectl create namespace monitoring || true
kubectl apply -f secrets.yaml --namespace monitoring
helm upgrade --install --values values.yaml gf grafana/grafana --namespace monitoring
```

## debug

### default values from chart
```bash
cd kubernetes/monitoring/grafana
helm show values grafana/grafana > ./values-documentation.yaml
```

### current values from chart
```bash
cd kubernetes/monitoring/grafana
mkdir debug
helm get values gf --namespace monitoring -o yaml > ./debug/values.yaml
helm get values gf --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template gf grafana/grafana --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd kubernetes/monitoring/grafana
helm uninstall gf --namespace monitoring
kubectl delete -f secrets.yaml --namespace monitoring
```