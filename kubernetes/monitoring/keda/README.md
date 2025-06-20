# monitoring/keda
## helm
```bash
helm repo add kedacore https://kedacore.github.io/charts
helm search repo kedacore
```
we will use `kedacore/keda`

## install
```bash
cd kubernetes/monitoring/keda
helm search repo kedacore/keda
kubectl create namespace monitoring || true
kubectl apply -f secrets.yaml --namespace monitoring
helm upgrade --install --values values.yaml kd kedacore/keda --namespace monitoring
```

## debug

### default values from chart
```bash
cd kubernetes/monitoring/keda
helm show values kedacore/keda > ./values-documentation.yaml
```

### current values from chart
```bash
cd kubernetes/monitoring/keda
mkdir debug
helm get values kd --namespace monitoring -o yaml > ./debug/values.yaml
helm get values kd --namespace monitoring --all -o yaml > ./debug/all-values.yaml
helm template kd kedacore/keda --values ./debug/all-values.yaml > ./debug/rendered.yaml
```

## uninstall
```bash
cd kubernetes/monitoring/keda
helm uninstall kd --namespace monitoring
kubectl delete -f secrets.yaml --namespace monitoring
```