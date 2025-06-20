# monitoring/tempo
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we can use `grafana/tempo` (monolith) or `grafana/tempo-distributed`

## install
```bash
cd kubernetes/monitoring/tempo
helm search repo grafana/tempo
kubectl create namespace monitoring || true
kubectl apply -f secrets.yaml --namespace monitoring

# for tempo monolith
helm upgrade --install --values values-monolith.yaml tp grafana/tempo --namespace monitoring

# for tempo microservices
helm upgrade --install --values values.yaml tp grafana/tempo-distributed --namespace monitoring
```

## debug

### default values from chart
```bash
cd kubernetes/monitoring/tempo
helm show values grafana/tempo-distributed > ./values-documentation.yaml
```

### current values from chart
```bash
cd kubernetes/monitoring/tempo
mkdir debug
helm get values tp --namespace monitoring -o yaml > ./debug/values.yaml
helm get values tp --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template tp grafana/tempo-distributed --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd kubernetes/monitoring/tempo
helm uninstall tp --namespace monitoring
kubectl delete -f secrets.yaml --namespace monitoring
```