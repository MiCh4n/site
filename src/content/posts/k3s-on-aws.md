---
title: "K3s on Aws"
date: 2021-04-30T11:26:51+02:00
draft: false
---
Repository link -> [https://github.com/MiCh4n/k3s-on-aws](https://github.com/MiCh4n/k3s-on-aws)
# Deploy k3s on EC2 AWS
### Provision infrastructure on AWS using *Terraform*
* #### Creates:
    *  EC2 instance with Elastic IP
    *  VPC
    *  Subnet
    *  Route table
    *  Internet gateway
    *  Security groups with inbound rules to allow SSH and HTTP
### Ansible playbooks to setup k3s on remote instance 
### Deploy sample application on cluster and expose it to external world
---
### Jenkins create plan from terraform files and deploy it on AWS using provided credentials

```
# Create secret for jenkins to access aws
kubectl create secret generic aws-creds \
    --from-file=/home/yuli/.aws/credentials
```