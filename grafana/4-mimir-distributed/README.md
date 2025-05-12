# grafana/mimir-distributed
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/mimir-distributed`

## install
```bash
helm search repo grafana/mimir-distributed
helm upgrade --install mimir grafana/mimir-distributed -f values.yaml --namespace monitoring --create-namespace
```

## debug

### default values from chart
```bash
mkdir original
helm show values grafana/mimir-distributed > ./original/values.yaml
helm template mimir grafana/mimir-distributed --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
mkdir debug
helm get values mimir --namespace monitoring -o yaml > ./debug/values.yaml
helm get values mimir --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template mimir grafana/mimir-distributed --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall mimir --namespace monitoring
```