# grafana/mimir
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/mimir-distributed`

## install
```bash
cd production/2-grafana/4-mimir
helm search repo grafana/mimir-distributed
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana

# for mimir minimal
helm upgrade --install --values values-minimal.yaml mr grafana/mimir-distributed --namespace grafana

# for mimir
helm upgrade --install --values values.yaml mr grafana/mimir-distributed --namespace grafana
```

## debug

### default values from chart
```bash
cd production/2-grafana/4-mimir
mkdir original
helm show values grafana/mimir-distributed > ./original/values.yaml
helm template mr grafana/mimir-distributed --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
cd production/2-grafana/4-mimir
mkdir debug
helm get values mr --namespace grafana -o yaml > ./debug/values.yaml
helm get values mr --namespace grafana --all -o yaml > ./debug/all-values.yaml
helm template mr grafana/mimir-distributed --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd production/2-grafana/4-mimir
helm uninstall mr --namespace grafana
kubectl delete -f secrets.yaml --namespace grafana
```