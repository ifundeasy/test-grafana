# grafana/tempo-distributed
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/tempo-distributed`

## install
```bash
helm search repo grafana/tempo-distributed
helm upgrade --install tempo grafana/tempo-distributed -f values.yaml --namespace monitoring --create-namespace
```

## debug

### default values from chart
```bash
mkdir original
helm show values grafana/tempo-distributed > ./original/values.yaml
helm template tempo grafana/tempo-distributed --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
mkdir debug
helm get values tempo --namespace monitoring -o yaml > ./debug/values.yaml
helm get values tempo --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template tempo grafana/tempo-distributed --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall tempo --namespace monitoring
```