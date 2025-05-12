# grafana/beyla
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/beyla`

## install
```bash
helm search repo grafana/beyla
helm upgrade --install beyla grafana/beyla -f values.yaml --namespace monitoring --create-namespace
```

## debug

### default values from chart
```bash
mkdir original
helm show values grafana/beyla > ./original/values.yaml
helm template beyla grafana/beyla --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
mkdir debug
helm get values beyla --namespace monitoring -o yaml > ./debug/values.yaml
helm get values beyla --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template beyla grafana/beyla --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall beyla --namespace monitoring
```