[![Docker Repository on Quay](https://quay.io/repository/leopoldodonnell/gantry/status "Docker Repository on Quay")](https://quay.io/repository/leopoldodonnell/locust-loadtest)

# k8s-loadtest

A simple load testing framework for Kubernetes workloads using locust.

<p align='center'><img align="center" src="load-test.jpg" width="50%" height="50%"></p>

Kubernetes enables the rapid deployment of server-based applications on top of elastic
infrastructure that can scale with your needs. In important part of a rapid continuous
deployment strategy includes proof that your application can scale and remain stable under
load. This project includes a re-usable container image build and a re-usable deployment
configuration that will get you load-testing on your Kubernetes clusters in no time.

This load testing environment uses `locust`; a python based master/worker load testing tool.
In a nutshell, you use a simple python library to define your loadtests and then launch the
master and workers with the file containing the main entry point for your test.

Please see the [Locust Home Page](http://locust.io/) for more information on creating and
running your load tests.

This framework simplifies the use of `locust` in kubernetes by offering a `helm` deployment
that will get your loadtest out of your `git` repository and running it on a generic
locust container.

## Prerequisites

If you're starting from scratch and don't have a Kubernetes cluster, or just want to test it locally,
install `minikube`. Minikube runs on a VM on your laptop and is easy to install.

You will find more information on installing `minikube` [here](https://kubernetes.io/docs/getting-started-guides/minikube/)

Next you'll need two other tools:

1. `kubectl` - is the CLI tool for kubernetes and can be found [here](https://kubernetes.io/docs/user-guide/prereqs/)
1. `helm` - is the deployment tool for kubernetes. More information and download links can be found [here](https://github.com/kubernetes/helm)

## Quickstart

Once you've got your cluster started with `helm` and `kubectl` setup, you can familiar with this framework by using the
supplied `sample-app` found in the contrib folder.

http://locust.io/


**Step 1:** Setup your git ssh key, so kubernetes call pull your loadtest

```bash
kubectl create secret generic git-creds --from-file=ssh=~/.ssh/id_rsa
```

**Step 2** Startup the simple server with helm

```bash
helm install contrib/sample-app/charts/sample-app --name sample-app
```

**Step 3** Startup the load test with helm

```bash
helm install charts/locust-loadtest -f contrib/sample-app/locust-values.yaml --name locust
```

**Step 4** Verify that its all running and get the URI for `locust`

Open up your kubernetes dashboad (on minikube you type: `minikube dashboard`), select the `default` namespace and check that
you have:

* 2 sample-app pods
* 1 locust master pod
* 2 locust worker pods

Next click on `Services` and then find the *NodePort* where locust's control panel is exposed. This will be a port that is > 30000

**Step 5** Start Testing:

1. Load the Locust Page. If you're using minikube, it will use the same IP as your dashboard followed by the NodePort of the
locust service.
1. Setup the number of users to simulate: 100
1. Setup the Hatch Rate: 2

Now you should see the test page reporting 2 Slaves along with updating metrics for your test.

## Load Testing

TODO: Describe the deployment in more detail

### Write Your Own Loadtest

TODO: Describe extending the sample and writing a load test form scratch


