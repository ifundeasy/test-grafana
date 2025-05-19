# grafana/pyroscope
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/pyroscope`

## install
```bash
cd production/2-grafana/5-pyroscope
helm search repo grafana/pyroscope
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana

# for pyroscope minimal
helm upgrade --install --values values-minimal.yaml ps grafana/pyroscope --namespace grafana

# for pyroscope
helm upgrade --install --values values.yaml ps grafana/pyroscope --namespace grafana
```

## debug

### default values from chart
```bash
cd production/2-grafana/5-pyroscope
mkdir original
helm show values grafana/pyroscope > ./original/values.yaml
helm template ps grafana/pyroscope --values ./original/values.yaml > ./original/rendered.yaml
```

### current values from chart
```bash
cd production/2-grafana/5-pyroscope
mkdir debug
helm get values ps --namespace grafana -o yaml > ./debug/values.yaml
helm get values ps --namespace grafana --all -o yaml > ./debug/all-values.yaml
helm template ps grafana/pyroscope --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd production/2-grafana/5-pyroscope
helm uninstall ps --namespace grafana
kubectl delete -f secrets.yaml --namespace grafana
```