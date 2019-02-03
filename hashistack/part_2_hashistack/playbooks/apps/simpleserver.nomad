job "simple-server" {
  datacenters = ["lab"]
  type = "service"
  group "simpleserver" {
    count = 1
    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }
    ephemeral_disk {
      size = 300
      sticky = true
      migrate = true
    }

    task "httpserver0" {
      driver = "docker"

      config {
        image = "python:3.6.4-alpine3.7"
        command = "python3"
        args = [
          "-m",
          "http.server",
          "8000"
        ]
        port_map {
          http = 8000
        }
        dns_servers = [
          "consul.service.lab.consul"
        ]
        work_dir = "/var/www/html/"
      }

      resources {
        network {
          mbits = 1
          port "http" {
            static = 8000
          }
        }
      }

      service {
        name = "httpserver0"
        tags = [
          "traefik.tags=service",
          "traefik.frontend.rule=PathPrefixStrip:/0/",
        ]
        port = "http"
        check {
          name     = "alive"
          type     = "tcp"
          port     = "http"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }

  }
}