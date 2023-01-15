# dockerfile
https://github.com/pangliang/futu-opend-docker

# how to run

## docker

```bash
docker run -i -t \
   -v /path/to/redis-persistence:/root/.com.futunn.FutuOpenD \
   -e login_account=10000 \
   -e login_pwd=xxxxx \
   -p 11111:11111 \
   pangliang/futu-opend-docker:latest
```

more env : https://openapi.futunn.com/futu-api-doc/opend/opend-cmd.html#465

## k8s

```bash
kubectl --namespace default apply -f https://raw.githubusercontent.com/pangliang/futu-opend-docker/master/k8s.yml
```