---
title: "Crud Ec2"
date: 2021-04-30T18:19:16+02:00
draft: false
---
Repository link → [https://github.com/MiCh4n/crud-ec2](https://github.com/MiCh4n/crud-ec2)

### Infrastructure is a 3-tier architecture with 2 availability zones deployed on AWS
 - Public section
 - Private section
 - Database section

Application code with Jenkinsfile and other necessary files is stored in branches:
    - *MAIN* is production
    - *DEV* is development

Everything related to Infrastructure is stored in its own branch named *infrastructure*

Terraform is used with *Terraspace framework* to separate DEV and PROD environment

#### In public subnets reside *Application Load Balancer* which listens on endpoints:
 - /service
 - /services
 - /service/update
 - /service/delete

Also in public subnet is Bastion Host that listens on 22 for ssh with his public key.

#### In private subnets are only autoscaling group with API instances, on which artifact is deployed using Jenkins and CodeDeploy and listens on 7777 port for ALB, 22 port for Bastion Host. Routing and security groups are configured to allow connection between private and database subnets, and HTTPS outbound to access S3/CodeDeploy with NAT Gateway

#### In database subnets resides two mongo instances with ReplicaSet, security groups configured to allow inbound from private subnet on port 27017 and 22 for Bastion Host, also to connect between instances.

___

**Jenkins** is deployed on local kubernetes cluster and used to build, test (dummy 3 Unit, 2 Integration, 1 End-to-End tests) application and after that push artifact to **S3** where is stored with versioning. Then trigger **CodeDeploy** to get artifact from S3 and deploy it to autoscaling group, and run it as systemd service.

**Secrets** for Jenkins to access AWS are provided using bash script to generate them from *~.aws/credentials*, makes temporary yaml files to apply them to kubernetes on which Jenkins is running. 


#### App is simple webserver made with Go Fiber v2 framework that expose API and stores data in other instances with MongoDB replica sets

Uses key/value
 key | value
-------------|---------
name          | string
provider        | string

App listens on:

HTTP method | Endpoint| Action
-------------|---------|-------
GET          | /service/:id | Returns specific service
GET          | /services | Returns all services
POST         | /service | Add service
PUT          | /service/update/:id | Update specific service
DELETE       | /service/delete/:id | Delete specific service

AWS Infrastructure on diagram:

![aws-infrastructure](/diagram.png)