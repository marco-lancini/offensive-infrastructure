# Wekan


## Usage

* Edit `docker-compose.yml`:
    * Replace the `volume` locations (from `/docker/data/wekan/...` to the folder on your filesystem where you want to persist data)
    * Change the default password
* Start service: `docker-compose up`
* Access Wekan: `127.0.0.1:9001`
* [Optional] Add aliases to quickly spin this up/down:
```bash
alias wekan_up="docker-compose -f /Users/x/docker_compose_wekan-bookstack/docker-compose.yml up"
alias wekan_down="docker-compose -f /Users/x/docker_compose_wekan-bookstack/docker-compose.yml down"
```
