# Offensive Infrastructure

This repository will host the supporting code for the "[Offensive Infrastructure with Modern Technologies](https://www.marcolancini.it/offensive-infrastructure/)" blog series.

In the meantime, it hosts Ansible, Docker, and Terraform templates I'm currently using.


## DOCKER

| Folder                            | Description |
| --------------------------------- | ----------- |
| `docker_compose_clair`            | Spin up `Clair`, alongside `Postgres` and `Klar`, to scan Docker images for security vulnerabilities |
| `docker_compose_django`           | Django setup with `Postgres` (database), `Redis` (cache), and `nginx` (proxy) |
| `docker_compose_flask`            | Flask setup  |
| `docker_compose_nginx-proxy`      | Nginx-proxy setup |
| `docker_compose_wekan-bookstack`  | Local setup for Wekan and Bookstack |
| `docker_go_dev`                   | Development image for Golang. Published on [Docker Cloud](https://cloud.docker.com/swarm/marcolancini/repository/list)  |
| `docker_kali`                     | Image for kali. Published on [Docker Cloud](https://cloud.docker.com/swarm/marcolancini/repository/list)  |
| `docker_python_dev`               | Development image for Python2/3. Published on [Docker Cloud](https://cloud.docker.com/swarm/marcolancini/repository/list)  |



## TERRAFORM

| Folder                            | Description |
| --------------------------------- | ----------- |
| `terraform_vpc`                   | Terraform template for a full VPC setup |
