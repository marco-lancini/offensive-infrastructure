job "example" {
  datacenters = ["lab"]
  type = "service"
  group "sampleservice" {
    count = 1
    restart {
      attempts = 2
      interval = "30m"
      delay = "15s"
      mode = "fail"
    }
    task "sampleservice-db" {
      driver = "docker"
      config {
        image = "redis:3.2"
        network_mode = "bridge"
        port_map {
          sampleservicedb_port = 6379
        }
        labels {
          group = "label_db"
        }
        dns_servers = [
          "consul.service.lab.consul"
        ]
      }
      resources {
        network {
          mbits = 1
          port "sampleservicedb_port" {}
        }
      }
      service {
        name = "sampleservice-db-service"
        tags = ["sampleservice", "redis"]
        port = "sampleservicedb_port"
        check {
          name     = "alive"
          type     = "tcp"
          port     = "sampleservicedb_port"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
