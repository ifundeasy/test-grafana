# grafana/tempo
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we can use `grafana/tempo` or `grafana/tempo-distributed`

## install
```bash
cd production/grafana/3-tempo
helm search repo grafana/tempo
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana

# for tempo monolith
helm upgrade --install --values values-monolith.yaml tp grafana/tempo --namespace grafana

# for tempo microservices
helm upgrade --install --values values.yaml tp grafana/tempo-distributed --namespace grafana
```

## debug

### default values from chart
```bash
cd production/grafana/3-tempo
mkdir original
helm show values grafana/tempo > ./original/values.yaml
helm template tp grafana/tempo --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
cd production/grafana/3-tempo
mkdir debug
helm get values tp --namespace grafana -o yaml > ./debug/values.yaml
helm get values tp --namespace grafana --all -o yaml > ./debug/all-values.yaml
helm template tp grafana/tempo --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall tp --namespace grafana
cd production/grafana/3-tempo
kubectl delete -f secrets.yaml --namespace grafana
```