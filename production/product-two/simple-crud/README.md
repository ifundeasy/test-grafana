# simple-crud

## install
```bash
cd production/product-two
kubectl create namespace product-two || true
kubectl apply -f simple-crud --namespace product-two
```

## uninstall
```bash
cd production/product-two
kubectl delete -f simple-crud --namespace product-two
```

## usage
hello world
```bash
# assumed 58021 port is "simple-crud" pod from "product-two" namespace
curl --location 'http://localhost:58021'
```

create product
```bash
# assumed 58021 port is "simple-crud" pod from "product-two" namespace
curl --location 'http://localhost:58021/product' --header 'Content-Type: application/json' \
--data '{
    "name": "sirop tjampolay",
    "price": 1000,
    "stock": 100
}'
```

get products
```bash
# assumed 58021 port is "simple-crud" pod from "product-two" namespace
curl --location --request GET 'http://localhost:58021/products' --header 'Content-Type: application/json'
```

get product by id
```bash
# assumed 58021 port is "simple-crud" pod from "product-two" namespace
curl --location --request GET 'http://localhost:58021/product?id=6827ac8dbe36af32d9761dd5' --header 'Content-Type: application/json'
```

get products (external)
```bash
# assumed 58021 port is "simple-crud" pod from "product-two" namespace
# at this case"simple-crud" pod from "product-two" namespace hit GET /product from "simple-crud" of "product-one" namespace
curl --location --request GET 'http://localhost:58021/external' --header 'Content-Type: application/json'
```