# WIP k8s-loadtest
[![Docker Repository on Quay](https://quay.io/repository/leopoldodonnell/gantry/status "Docker Repository on Quay")](https://quay.io/repository/leopoldodonnell/locust-loadtest)

<p align='center'><img align="center" src="load-test.jpg" width="50%" height="50%"></p>

A simple load testing framework for Kubernetes workloads using locust

## Quickstart

1. Install minikube
1. Install kubectl
1. Install helm
1. Start up the simple server
1. Start up locust

Setup your git ssh key

```bash
kubectl create secret generic git-creds --from-file=ssh=~/.ssh/id_rsa
```

Startup the simple server

```bash
helm install contrib/sample-app/charts/sample-app --name sample-app
```

Startup the load test

```bash
helm install charts/locust-loadtest -f contrib/sample-app/charts/sample-app/locust-values.yaml --name locust
```

Start Testing:

1. Load the Locust Page
1. Setup the number of users to simulate: 100
1. Setup the Hatch Rate: 2

## Load Testing


