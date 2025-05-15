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
kubectl apply -f secrets.yaml --namespace monitoring
helm upgrade --install kilo grafana/loki-distributed -f values.yaml --namespace monitoring --create-namespace
```

## debug

### default values from chart
```bash
mkdir original
helm show values grafana/loki-distributed > ./original/values.yaml
helm template kilo grafana/loki-distributed --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
mkdir debug
helm get values kilo --namespace monitoring -o yaml > ./debug/values.yaml
helm get values kilo --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template kilo grafana/loki-distributed --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall kilo --namespace monitoring
```