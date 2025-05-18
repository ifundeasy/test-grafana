# grafana/grafana
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/grafana`

## install
```bash
cd production/grafana/1-grafana
helm search repo grafana/grafana
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml gf grafana/grafana --namespace grafana
```

## debug

### default values from chart
```bash
cd production/grafana/1-grafana
mkdir original
helm show values grafana/grafana > ./original/values.yaml
helm template gf grafana/grafana --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
cd production/grafana/1-grafana
mkdir debug
helm get values gf --namespace grafana -o yaml > ./debug/values.yaml
helm get values gf --namespace grafana --all -o yaml > ./debug/all-values.yaml
helm template gf grafana/grafana --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
helm uninstall gf --namespace grafana
cd production/grafana/1-grafana
kubectl delete -f secrets.yaml --namespace grafana
```