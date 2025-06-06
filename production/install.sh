# alloy grafana: creation
cd ~/Developer/test-grafana/production/2-grafana/0-alloy
kubectl create namespace grafana || true
helm upgrade --install --values values.yaml al-grafana grafana/alloy --namespace grafana

# grafana: creation
cd ~/Developer/test-grafana/production/2-grafana/1-grafana
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml gf grafana/grafana --namespace grafana

# loki: creation
cd ~/Developer/test-grafana/production/2-grafana/2-loki
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml lk grafana/loki --namespace grafana

# tempo: creation
cd ~/Developer/test-grafana/production/2-grafana/3-tempo
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml tp grafana/tempo-distributed --namespace grafana

# mimir: creation
cd ~/Developer/test-grafana/production/2-grafana/4-mimir
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml mr grafana/mimir-distributed --namespace grafana

# pyroscope: creation
cd ~/Developer/test-grafana/production/2-grafana/5-pyroscope
kubectl create namespace grafana || true
kubectl apply -f secrets.yaml --namespace grafana
helm upgrade --install --values values.yaml ps grafana/pyroscope --namespace grafana

##########################

# alloy product-one: creation
cd ~/Developer/test-grafana/production/product-one/0-alloy
kubectl create namespace product-one || true
helm upgrade --install --values values.yaml al-product-one grafana/alloy --namespace product-one

# simple crud product-one: creation
cd ~/Developer/test-grafana/production/product-one
kubectl create namespace product-one || true
kubectl apply -f simple-crud --namespace product-one

# alloy product-two: creation
cd ~/Developer/test-grafana/production/product-two/0-alloy
kubectl create namespace product-two || true
helm upgrade --install --values values.yaml al-product-two grafana/alloy --namespace product-two

# simple crud product-two: creation
cd ~/Developer/test-grafana/production/product-two
kubectl create namespace product-two || true
kubectl apply -f simple-crud --namespace product-two