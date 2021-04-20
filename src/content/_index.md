---
title: "Julian Dobrosielski"
date: 2021-04-14T16:40:38Z
draft: false
---
Hi! Here you can find info about site, my projects which im working on and also view and download my CV

Im hosting this website on VPS using nginx as webserver, hugo generates static html files. 
Nginx expose statistics about his metrics, then nginx-prometheus-exporter consume data and "send" it to prometheus and after that Grafana is used to show data.
Source code is stored in github remote repository, which sends webhooks to server, then triggers script to pull repository and after that uses hugo to generate static html files which are moved to nginx site directory.

