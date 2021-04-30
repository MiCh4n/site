---
title: "Crud Ec2"
date: 2021-04-30T11:30:37+02:00
draft: false
---
Repository link → [https://github.com/MiCh4n/crud-ec2](https://github.com/MiCh4n/crud-ec2)

#### Two EC2 instances on AWS with custom AMIs made with Packer each one with their roles, security groups *27017* for mongodb instance, *7777* for api instance (ssh enabled on both)

**Jenkins** build, test (dummy 3 Unit, 2 Integration, 1 End-to-End tests) application and after that pushes artifact to **S3** where is stored with versioning. Then trigger **CodeDeploy** to get artifact from S3 and deploy it to EC2 instance, and run it as systemd service.

---
**Secrets** for Jenkins to access AWS are provided using bash script to generate them from *~.aws/credentials*, makes temporary yaml files to apply them to kubernetes on which Jenkins is running. 
#### App is simple webserver made with Go Fiber framework that expose API and stores data in other instance with mongodb
Uses key/value on endpoints
___
 key | value
-------------|---------
name          | string
provider        | string

http methods | endpoint
-------------|---------
GET          | /service/:id?
POST         | /service
PUT          | /service/:id
DELETE       | /service/:id
