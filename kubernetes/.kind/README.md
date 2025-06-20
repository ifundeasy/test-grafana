# kubernetes/.kind

## windows user rules
1. disabled kubernetes from docker-desktop // this is confusing
2. backup .kube/config on wsl or windows
3. create .kube/config on wsl
4. on wsl copy kube config backup from step #2 to .kube/config
5. on lens application; import .kube/config from wsl

## install kind
```bash
sudo curl -Lo /usr/local/bin/kind https://kind.sigs.k8s.io/dl/v0.19.0/kind-linux-amd64
sudo chmod +x /usr/local/bin/kind
kind --version
```

## cluster
```bash
cd kubernetes/.kind
kind create cluster --name locale --config config.yaml --wait 120s
kubectl config use-context kind-locale
kubectl config current-context
kubectl get pods -n kube-system

# metric
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl -n kube-system describe deployment metrics-server
kubectl -n kube-system patch deployment metrics-server \
  --type=json \
  -p='[
    { "op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls" }
  ]'
kubectl -n kube-system describe deployment metrics-server
```

## helm
```bash
curl https://baltocdn.com/helm/signing.asc | sudo tee /etc/apt/trusted.gpg.d/helm.asc > /dev/null
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt update
sudo apt install helm
```

## start/stop
see on your docker-desktop, start/stop the containers manually

## uninstall cluster
```bash
kind delete cluster --name locale
```
