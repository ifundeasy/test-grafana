```bash
cd /home/ifundeasy/Developer/test-grafana/production/2-grafana/5-pyroscope
kubectl apply -f simple-crud --namespace grafana
kubectl delete -f simple-crud --namespace grafana
```