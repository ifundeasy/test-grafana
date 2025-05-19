# grafana/tempo
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we can use `grafana/tempo` (monolith) or `grafana/tempo-distributed`

## install
```bash
cd production/2-grafana/3-tempo
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
cd production/2-grafana/3-tempo
mkdir original
helm show values grafana/tempo-distributed > ./original/values.yaml
helm template tp grafana/tempo-distributed --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
cd production/2-grafana/3-tempo
mkdir debug
helm get values tp --namespace grafana -o yaml > ./debug/values.yaml
helm get values tp --namespace grafana --all -o yaml > ./debug/all-values.yaml
helm template tp grafana/tempo-distributed --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd production/2-grafana/3-tempo
helm uninstall tp --namespace grafana
kubectl delete -f secrets.yaml --namespace grafana
```