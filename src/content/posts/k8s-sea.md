---
title: "K8s-Sea"
description: "Two APIs on k8s connected with Consul"
date: 2021-04-30T18:17:01+02:00
draft: false
---
Repository link → [https://github.com/MiCh4n/k8s-sea](https://github.com/MiCh4n/k8s-sea)
## Two applications written in *Go* deployed on kubernetes cluster
* ### Pirates expose API on port 6000
* ### Sea fetch data from pirates endpoint using *Consul* to establish HTTPS connection between them, and also expose HTTP server on port 5000
Corresponding applications have their own branches to easier maintain them and deploy by **Jenkins**.  
Jenkins test, create image using kaniko container and push to docker registry after that deploy to cluster.
```
# Create secret for docker creds to push image to registry
kubectl create secret generic jenkins-docker-creds \
    --from-file=.dockerconfigjson=/home/<your profile>/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson

# Create service account for jenkins deploy stage
kubectl create serviceaccount deployer -n jenkins

kubectl create rolebinding jenkins-deployer-edit --clusterrole=edit --serviceaccount=jenkins:deployer -n jenkins

kubectl create clusterrolebinding jenkins-deployer-admin --clusterrole=cluster-admin --serviceaccount=jenkins:deployer
```