# grafana/oncall
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/oncall`

## install
```bash
helm search repo grafana/oncall
helm upgrade --install oncall grafana/oncall -f values.yaml --namespace monitoring --create-namespace
```

## debug

### default values from chart
```bash
mkdir original
helm show values grafana/oncall > ./original/values.yaml
helm template oncall grafana/oncall --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
mkdir debug
helm get values oncall --namespace monitoring -o yaml > ./debug/values.yaml
helm get values oncall --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template oncall grafana/oncall --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall oncall --namespace monitoring
```