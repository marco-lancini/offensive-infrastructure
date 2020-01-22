# Templates

This folder contains some building blocks.

## ANSIBLE

| Role              | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| `dev-os`          | Setup OS for Ubuntu dev                                      |
| `dev-sw`          | Install software for Ubuntu dev                              |
| `dev-vscode`      | Install VSCode                                               |
| `docker`          | Install docker                                               |
| `golang`          | Install golang                                               |
| `kali-cloud`      | Install tools to perform cloud assessments (AWS, Azure, GCP) |
| `kali-metasploit` | Install MSF, configure Postgres, setup msfdb and Armitage    |
| `kali-os`         | Update OS, setup locales, add users, config ufw and zsh      |
| `kali-red`        | For red teams (empire, dnscat2, etc.). **UNDER DEVELOPMENT** |
| `kali-sw`         | Install basic maintenance, dev, and pt tools                 |
| `kali-wifi`       | Wi-Fi pentesting tools                                       |
| `mobile-android`  | Android tools                                                |
| `mobile-ios`      | iOS tools                                                    |


## DOCKER

| Folder                             | Description                                                                                                         |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `admin_collab_draw-pad-whiteboard` | Local setup for Draw.io, Pad, and Whiteboard                                                                        |
| `admin_raneto`                     | Local setup for Raneto (Wiki)                                                                                       |
| `admin_wekan`                      | Local setup for Wekan                                                                                               |
| `admin_wikijs`                     | Local setup for WikiJS                                                                                              |
| `dev_go`                           | Development image for Golang. Published on [Docker Hub](https://cloud.docker.com/u/marcolancini/repository/list)    |
| `docker_kali`                      | Image for kali. Published on [Docker Hub](https://cloud.docker.com/u/marcolancini/repository/list)                  |
| `dev_python`                       | Development image for Python2/3. Published on [Docker Hub](https://cloud.docker.com/u/marcolancini/repository/list) |
| `docker_vault`                     | [Docker + Consul + Vault](https://github.com/marco-lancini/docker_vault)                                            |
| `ops_ansible-worker`               | Image for Ansible. Published on [Docker Hub](https://cloud.docker.com/u/marcolancini/repository/list)               |
| `ops_clair`                        | Spin up `Clair`, alongside `Postgres` and `Klar`, to scan Docker images for security vulnerabilities                |
| `ops_nomad`                        | Image for Nomad. Published on [Docker Hub](https://cloud.docker.com/u/marcolancini/repository/list)                 |
| `web_django`                       | Django setup with `Postgres` (database), `Redis` (cache), and `nginx` (proxy)                                       |
| `web_flask`                        | Flask setup                                                                                                         |
| `web_nginx-proxy`                  | Nginx-proxy setup                                                                                                   |



## TERRAFORM

| Folder          | Description                             |
| --------------- | --------------------------------------- |
| `terraform_vpc` | Terraform template for a full VPC setup |
