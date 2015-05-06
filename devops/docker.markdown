docker
===

run command
---
```bash
docker run [args] image:tag [command] [args]
docker run -it busybox sh/
```

boot2docker commands
---
```bash
boot2docker up # starts vm
boot2docker down # stops vm
boot2docker status # shows vm status
```

docker image commands
---
```bash
docker pull phusion/baseimage
docker rmi image_id # remove image

common commands
---
```bash
docker run -i -t debian /bin/bash
docker run -d -t postgres
docker run -d -t postgres:9.3

docker ps
docker logs container_id
docker stop container_id
docker kill container_id
docker start container_id

docker commit container_id
docker tag image_id new_image_name
docker push username/my_new_image

docker build

docker rm

docker info
docker ps -a
docker images
docker run -i -t ubuntu:12.10 /bin/bash
docker diff
docker commit id_number chickenriceplatter/custom-image-name # create custom image
docker push chickenriceplatter/custom-image-name # goto: index.docker.io

docker run -p 8080
```

ports
---
```bash
docker run -p local_port_number:docker_port_number -d nginx
```

mounting volume
---
```bash
docker run -it -v host_directory:container_directory
docker run -it -v /Users/dave/some_folder:/some_folder
