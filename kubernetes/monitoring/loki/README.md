# monitoring/loki
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/loki` (this is compatible both monolith or distributed)

## install
```bash
cd kubernetes/monitoring/loki
helm search repo grafana/loki
kubectl create namespace monitoring || true
kubectl apply -f secrets.yaml --namespace monitoring

# for loki monolith
helm upgrade --install --values values-monolith.yaml lk grafana/loki --namespace monitoring

# for loki microservices
helm upgrade --install --values values.yaml lk grafana/loki --namespace monitoring
```

## debug

### default values from chart
```bash
cd kubernetes/monitoring/loki
helm show values grafana/loki > ./values-documentation.yaml
```

### current values from chart
```bash
cd kubernetes/monitoring/loki
mkdir debug
helm get values lk --namespace monitoring -o yaml > ./debug/values.yaml
helm get values lk --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template lk grafana/loki --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd kubernetes/monitoring/loki
helm uninstall lk --namespace monitoring
kubectl delete -f secrets.yaml --namespace monitoring
```