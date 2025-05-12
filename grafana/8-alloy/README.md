# grafana/alloy
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/alloy`

## install
```bash
helm search repo grafana/alloy
helm upgrade --install alloy grafana/alloy -f values.yaml --namespace monitoring --create-namespace
```

## debug

### default values from chart
```bash
mkdir original
helm show values grafana/alloy > ./original/values.yaml
helm template alloy grafana/alloy --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
mkdir debug
helm get values alloy --namespace monitoring -o yaml > ./debug/values.yaml
helm get values alloy --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template alloy grafana/alloy --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall alloy --namespace monitoring
```