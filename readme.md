# Laravel with Docker and Kubernetes!

## Getting started

### 1. Clone repo

### 2. Build images
```bash
docker-compose build
```

### 3. Deploy the stack
Deploy the docker-compose stack to a Kubernetes cluster
```bash
docker stack deploy --compose-file docker-compose.yml laravel-kubernetes
```

If you have a docker-compose.override file it needs to be include as well
```bash
docker stack deploy --compose-file docker-compose.yml --compose-file docker-compose.override.yml laravel-kubernetes
```
