# cluster: creation
cd ~/Developer/test-grafana/production/1-cluster
kind create cluster --name locale --config config.yaml
kubectl config use-context kind-locale
kubectl config current-context
kubectl get pods -n kube-system
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl -n kube-system describe deployment metrics-server
kubectl -n kube-system patch deployment metrics-server \
  --type=json \
  -p='[
    { "op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls" }
  ]'
kubectl -n kube-system describe deployment metrics-server

# # for delete kubernetes kind cluster
# kind delete cluster --name locale