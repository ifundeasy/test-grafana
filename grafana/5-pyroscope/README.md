# grafana/pyroscope
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/pyroscope`

## install
```bash
helm search repo grafana/pyroscope
helm upgrade --install pyroscope grafana/pyroscope -f values.yaml --namespace monitoring --create-namespace
```

## debug

### default values from chart
```bash
mkdir original
helm show values grafana/pyroscope > ./original/values.yaml
helm template pyroscope grafana/pyroscope --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
mkdir debug
helm get values pyroscope --namespace monitoring -o yaml > ./debug/values.yaml
helm get values pyroscope --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template pyroscope grafana/pyroscope --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall pyroscope --namespace monitoring
```