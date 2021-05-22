My custom role for *Ansible* to provision all infrastructure to automate deployment.

To run this playbook use this with custom hosts file
```
ansible-playbook -i hosts site.yml
```
Playbook will provision necessary users/groups and directories, configure nginx and all metrics/logs stuff (prometheus, loki, promtail) for Grafana to consume.

But also setup fail2ban, unattended-upgrades and UFW rules.