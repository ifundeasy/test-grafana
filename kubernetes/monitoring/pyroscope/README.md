# monitoring/pyroscope
## helm
```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
```
we will use `grafana/pyroscope`

## install
```bash
cd kubernetes/monitoring/pyroscope
helm search repo grafana/pyroscope
kubectl create namespace monitoring || true
kubectl apply -f secrets.yaml --namespace monitoring

# for pyroscope minimal
helm upgrade --install --values values-minimal.yaml ps grafana/pyroscope --namespace monitoring

# for pyroscope
helm upgrade --install --values values.yaml ps grafana/pyroscope --namespace monitoring
```

## debug

### default values from chart
```bash
cd kubernetes/monitoring/pyroscope
# helm show values grafana/pyroscope > ./values-documentation.yaml
curl -Lo values-documentation.yaml https://raw.githubusercontent.com/grafana/pyroscope/main/operations/pyroscope/helm/pyroscope/values-micro-services-hpa.yaml
```

### current values from chart
```bash
cd kubernetes/monitoring/pyroscope
mkdir debug
helm get values ps --namespace monitoring -o yaml > ./debug/values.yaml
helm get values ps --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template ps grafana/pyroscope --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd kubernetes/monitoring/pyroscope
helm uninstall ps --namespace monitoring
kubectl delete -f secrets.yaml --namespace monitoring
```