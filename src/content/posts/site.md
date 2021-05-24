---
title: "Site"
description: "Source code of my site and its infrastructure"
date: 2021-04-30T18:18:01+02:00
draft: false
---
Repository link → [https://github.com/MiCh4n/site](https://github.com/MiCh4n/site)

Here is source code of my website :)
I use *Hugo* to generate html from markdown files
after I push changes to remote repository webhook is sent to VPS where I host site and triggers
scripts to automate deployment process

Everything is provided using custom ansible role (nginx, deployment, prometheus, grafana, loki etc.)
![site workflow](/site-workflow.png)
