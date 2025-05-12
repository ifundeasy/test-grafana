# grafana/lgtm-distributed (umbrella)
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/lgtm-distributed`

## install
```bash
helm search repo grafana/lgtm-distributed
helm upgrade --install lgtm grafana/lgtm-distributed -f values.yaml --namespace monitoring --create-namespace
```

## debug

### default values from chart
```bash
mkdir original
helm show values grafana/lgtm-distributed > ./original/values.yaml
helm template lgtm grafana/lgtm-distributed --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
mkdir debug
helm get values lgtm --namespace monitoring -o yaml > ./debug/values.yaml
helm get values lgtm --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template lgtm grafana/lgtm-distributed --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall lgtm --namespace monitoring
```