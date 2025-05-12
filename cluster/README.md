# kube (kind)

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
kind create cluster --name locale --config config.yaml
kubectl config use-context kind-locale
kubectl config current-context
kubectl get pods -n kube-system
```

## helm
```bash
curl https://baltocdn.com/helm/signing.asc | sudo tee /etc/apt/trusted.gpg.d/helm.asc > /dev/null
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt update
sudo apt install helm
```

## preparation
```bash
kubectl create namespace monitoring
```

## start/stop
see on your docker-desktop, start/stop it manually

## uninstall cluster
```bash
kind delete cluster --name locale
```
