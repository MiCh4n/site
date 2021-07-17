job "internals" {
  datacenters = ["dc382"]

  group "backend" {
    network {
      port "nginx" {
        static = "8080"
        to = "80"
      }
    }

    task "nginx" {
        driver = "docker"

        resources {
          cpu = 300
          memory = 256
        }

        config {
          image = "ghcr.io/mich4n/site:latest"
          ports = ["nginx"]
        }
    }

    task "promtail" {
      driver = "docker"

      resources {
        cpu = 100
        memory = 128
      }

      template {
        data = <<EOF
server:
  http_listen_port: 0
  grpc_listen_port: 0

positions:
  filename: /tmp/positions.yaml

client:
  url: {{ lookup('env', 'GRAFANA_URL') }}

scrape_configs:
- job_name: nginx_out
  static_configs:
  - targets:
      - localhost
    labels:
      job: varlogs_out
      __path__: /var/log/nginx.stdout.*

- job_name: nginx_err
  static_configs:
  - targets:
      - localhost
    labels:
      job: varlogs_err
      __path__: /var/log/nginx.stderr.*
        EOF
        destination = "local/config.yml"
      }

      config {
        image = "grafana/promtail:main-d6dc8b9"
        volumes = [
          "../alloc/logs:/var/log",
          "local/config.yml:/etc/promtail/config.yaml"
        ]
        args = [
          "-config.file=/etc/promtail/config.yaml"
        ]
      }
    }
  }
}