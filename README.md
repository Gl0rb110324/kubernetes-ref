# Useful commands

## General 

```
alias k='kubectl'
alias all='all-namespaces'
kubectl config set-context --current --namespace default
k get  <resource> <resource_name> -o yaml > <config_dir>
```


## pods

```
kubectl run <pod_name> --dry-run=client --image=<image>:<tag> -o yaml > yaml_conf.yaml #generate template
kubectl run <pod_name> --image nginx
k run redis --image redis:alpine --labels tier=db
k run custom-nginx --image nginx --port 8080
k get pods -l environment=production,tier=frontend
k get pod -l env=prod,tier=frontend,bu=finance
```

## Deployments
*A ReplicaSet ensures that a specified number of pod replicas are running at any given time. 
However, a Deployment is a higher-level concept that manages ReplicaSets and provides declarative updates to Pods along with a lot of other useful features.14 Mar 2024*

```
k create deployment <deployment_name> --image httpd:2.4-alpine --replicas <replica_number> --dry-run=client -o yaml > deployment_config.yaml

k create deployment redis-deploy --image redis -n dev-ns --replicas 2
```

## Namespaces 
Naming convention of reosurces in different namespace:
<svc_name>.<namespace>.<cluster>.<local>
- cluster is the cluster domain 
- local is the suffix typically set by default

```
k create ns dev-ns

```

## Services
```
kubectl create service clusterip redis --tcp=6379:6379 --dry-run=client -o yaml

k run httpd --image httpd:alpine --port 80 --expose *creates pod AND service - Label assigned to selector in pod to connect the two*

```

## deployments
```
k create deployment webapp --image kodekloud/webapp-color --replicas 3
```

## tains and tolerations
below. use the command again to remove the taint!
```
kubectl taint nodes <node-name> key=value:<taint-effect>

```

## nodes

```
kubectl label pods app=nginx tier=fe ##add label to node

```

## daemonsets
```

```