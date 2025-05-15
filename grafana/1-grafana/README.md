# grafana/grafana
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/grafana`

## install
```bash
helm search repo grafana/grafana
kubectl apply -f secrets.yaml --namespace monitoring --create-namespace
helm upgrade --install nafagra grafana/grafana -f values.yaml --namespace monitoring --create-namespace
```

## debug

### default values from chart
```bash
mkdir original
helm show values grafana/grafana > ./original/values.yaml
helm template nafagra grafana/grafana --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
mkdir debug
helm get values nafagra --namespace monitoring -o yaml > ./debug/values.yaml
helm get values nafagra --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template nafagra grafana/grafana --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall nafagra --namespace monitoring
```