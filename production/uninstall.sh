# alloy grafana: deletion
cd ~/Developer/test-grafana/production/2-grafana/0-alloy
helm uninstall al-grafana --namespace grafana

# grafana: deletion
cd ~/Developer/test-grafana/production/2-grafana/1-grafana
helm uninstall gf --namespace grafana

# loki: deletion
cd ~/Developer/test-grafana/production/2-grafana/2-loki
helm uninstall lk --namespace grafana

# tempo: deletion
cd ~/Developer/test-grafana/production/2-grafana/3-tempo
helm uninstall tp --namespace grafana

# mimir: deletion
cd ~/Developer/test-grafana/production/2-grafana/4-mimir
helm uninstall mr --namespace grafana

# pyroscope: deletion
cd ~/Developer/test-grafana/production/2-grafana/5-pyroscope
helm uninstall ps --namespace grafana

##########################

# alloy product-one: deletion
cd ~/Developer/test-grafana/production/product-one/0-alloy
helm uninstall al-product-one --namespace product-one

# simple crud product-one: deletion
cd ~/Developer/test-grafana/production/product-one
kubectl delete -f simple-crud --namespace product-one

# alloy product-two: deletion
cd ~/Developer/test-grafana/production/product-two/0-alloy
helm uninstall al-product-two --namespace product-two

# simple crud product-two: deletion
cd ~/Developer/test-grafana/production/product-two
kubectl delete -f simple-crud --namespace product-two

# namespace: deletion
kubectl delete namespace product-two
kubectl delete namespace product-one
kubectl delete namespace grafana