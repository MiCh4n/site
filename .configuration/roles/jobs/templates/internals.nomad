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
          image = "nginx:stable-alpine"
          ports = ["nginx"]
        }
    }

    task "promtail" {
      driver = "docker"

      resources {
        cpu = 100
        memory = 128
      }

      config {
        image = "grafana/promtail:main-d6dc8b9"
      }
    }
  }
}