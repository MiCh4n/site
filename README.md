This repository contains how I manage my website. 

*Github Actions* are used as CI/CD to build and publish custom docker image (*nginx alpine + static files built with hugo*) in github packages. *Nomad* is responsible for workload in vps (*debian 10*), keeps eye on "nginx" and *promtail* containers. 

Everything is behind reverse proxy (*haproxy*) and with simple custom firewall in nftables

![site workflow](docs/img/nomad_diagram.png)
