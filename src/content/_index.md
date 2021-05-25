---
title: "Julian Dobrosielski"
date: 2021-04-14T16:40:38Z
draft: false
---
Hi! Here you can find info about site, my projects which im working on and also view and download my CVs


Im hosting this website on VPS using Nginx as webserver, Hugo to generate static html files and custom Bash scripts to automate deployment of new changes to site. 


Grafana consumes metrics from *Prometheus* about my instance (node_exporter), and *Loki* with *Promtail* to show logs from Nginx


Source code is stored in github remote repository, which sends webhooks to server, then trigger script to pull repository form GitHub and after that uses Hugo to generate static html files which are moved to Nginx www directory

Everything is provided using custom *Ansible* role (nginx, deployment, prometheus, grafana, loki etc.)