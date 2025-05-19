# grafana/loki
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/loki` (this is compatible both monolith or distributed)

## install
```bash
cd production/2-grafana/2-loki
helm search repo grafana/loki
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana

# for loki monolith
helm upgrade --install --values values-monolith.yaml lk grafana/loki --namespace grafana

# for loki microservices
helm upgrade --install --values values.yaml lk grafana/loki --namespace grafana
```

## debug

### default values from chart
```bash
cd production/2-grafana/2-loki
mkdir original
helm show values grafana/loki > ./original/values.yaml
helm template lk grafana/loki --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
cd production/2-grafana/2-loki
mkdir debug
helm get values lk --namespace grafana -o yaml > ./debug/values.yaml
helm get values lk --namespace grafana --all -o yaml > ./debug/all-values.yaml
helm template lk grafana/loki --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd production/2-grafana/2-loki
helm uninstall lk --namespace grafana
kubectl delete -f secrets.yaml --namespace grafana
```