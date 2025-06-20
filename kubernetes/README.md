# kubernetes

## Installation step

### 1. Install kind & dependencies

```bash
cd ../dependency
docker compose up -d

cd kubernetes
./kind.sh install
```

### 2. install keda

```bash
cd kubernetes
./keda.sh install
```

### 3. install mimir

```bash
cd kubernetes
./mimir.sh install
```

### 4. install loki

```bash
cd kubernetes
./loki.sh install
```

### 5. install tempo

```bash
cd kubernetes
./tempo.sh install
```

### 6. install pyroscope

```bash
cd kubernetes
./pyroscope.sh install
```

### 7. install grafana

```bash
cd kubernetes
./grafana.sh install
```

### 8. install grafana > alloy

```bash
cd kubernetes
./grafana-alloy.sh install
```

### 9. install grafana > alloy

```bash
cd kubernetes
./grafana-alloy.sh install
```

### 10. install business unit apps (1)

> [API contract will found on ifundeasy/simple-crud](https://github.com/ifundeasy/simple-crud)

```bash
cd kubernetes
./product-one.sh install
```

### 11. install business unit apps (2)

> [API contract will found on ifundeasy/simple-crud](https://github.com/ifundeasy/simple-crud)

```bash
cd kubernetes
./product-two.sh install
```
