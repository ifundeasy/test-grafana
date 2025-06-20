# monitoring/mimir
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/mimir-distributed`

## install
```bash
cd kubernetes/monitoring/mimir
helm search repo grafana/mimir-distributed
kubectl create namespace monitoring || true
kubectl apply -f secrets.yaml --namespace monitoring

# for mimir minimal
helm upgrade --install --values values-minimal.yaml mr grafana/mimir-distributed --namespace monitoring

# for mimir
helm upgrade --install --values values.yaml mr grafana/mimir-distributed --namespace monitoring
```

## debug

### default values from chart
```bash
cd kubernetes/monitoring/mimir
helm show values grafana/mimir-distributed > ./values-documentation.yaml
```

### current values from chart
```bash
cd kubernetes/monitoring/mimir
mkdir debug
helm get values mr --namespace monitoring -o yaml > ./debug/values.yaml
helm get values mr --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template mr grafana/mimir-distributed --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd kubernetes/monitoring/mimir
helm uninstall mr --namespace monitoring
kubectl delete -f secrets.yaml --namespace monitoring
```