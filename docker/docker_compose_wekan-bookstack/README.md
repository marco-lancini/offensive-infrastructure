# Wekan + BookStack


## Edit `docker-compose.yml`

* Replace the `volume` locations (from `/docker/data/wekan_bookstack/...` to the folder on your filesystem where you want to persist data)
* Change the default passwords
* [Optional] Add aliases to quickly spin this up/down:
```
alias wekan_up="docker-compose -f /Users/x/docker_compose_wekan-bookstack/docker-compose.yml up"
alias wekan_down="docker-compose -f /Users/x/docker_compose_wekan-bookstack/docker-compose.yml down"
```

## How to access the services

* `127.0.0.1:9001`: Wekan
* `127.0.0.1:9002`: Bookstack
