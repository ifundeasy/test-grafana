# grafana/alloy
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/alloy`

## install
```bash
cd production/2-grafana/0-alloy
helm search repo grafana/alloy
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml al grafana/alloy --namespace grafana
```

## debug

### default values from chart
```bash
cd production/2-grafana/0-alloy
mkdir original
helm show values grafana/alloy > ./original/values.yaml
helm template al grafana/alloy --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
cd production/2-grafana/0-alloy
mkdir debug
helm get values al --namespace grafana -o yaml > ./debug/values.yaml
helm get values al --namespace grafana --all -o yaml > ./debug/all-values.yaml
helm template al grafana/alloy --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd production/2-grafana/0-alloy
helm uninstall al --namespace grafana
kubectl delete -f secrets.yaml --namespace grafana
```