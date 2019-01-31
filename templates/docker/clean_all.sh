# Remove all exited containers
sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm

# Remove untagged images
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")

# Remove dangling images
docker rmi $(docker images --quiet --filter "dangling=true")

# Remove all unused or dangling images, containers, volumes, and networks
docker system prune -a

#docker volume prune
#docker network prune
#docker container prune
#docker image prune
#docker stop $(docker ps -a -q)
#docker rm $(docker ps -a -q)
#docker volume rm $(docker volume ls -f dangling=true -q) 
#docker rmi $(docker images -f dangling=true -q)
#docker rmi $(docker images -a -q) 