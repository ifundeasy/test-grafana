# grafana/loki-distributed
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/loki-distributed`

## install
```bash
helm search repo grafana/loki-distributed
helm upgrade --install loki grafana/loki-distributed -f values.yaml --namespace monitoring --create-namespace
```

## debug

### default values from chart
```bash
mkdir original
helm show values grafana/loki-distributed > ./original/values.yaml
helm template loki grafana/loki-distributed --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
mkdir debug
helm get values loki --namespace monitoring -o yaml > ./debug/values.yaml
helm get values loki --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template loki grafana/loki-distributed --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall loki --namespace monitoring
```