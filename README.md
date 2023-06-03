# Docker image
https://hub.docker.com/r/pangliang/futuopend-docker


# How to run

## Docker

```bash
docker run -i -t \
   -v /path/to/redis-persistence:/root/.com.futunn.FutuOpenD \
   -e login_account=10000 \
   -e login_pwd=xxxxx \
   -p 11111:11111 \
   pangliang/futuopend-docker:latest
```

more env : [https://www.moomoo.com/download/OpenAPI](https://www.moomoo.com/download/OpenAPI)

## K8s

```bash
kubectl --namespace default apply -f https://raw.githubusercontent.com/pangliang/futuopend-docker/master/k8s.yml
```
