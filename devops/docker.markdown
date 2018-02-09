docker
===

boot2docker commands
---
```bash
boot2docker up # starts vm
boot2docker down # stops vm
boot2docker status # shows vm status
boot2docker ip # show ip
```

docker commands
---

### stop container
```bash
docker stop [container_id]
```

### remove container
```bash
docker rm [container_id]
```
### show containers
```bash
docker ps -a
```

### show only container ids
```bash
docker ps -qa
```

### remove all exited containers
```bash
docker rm $(docker ps -qa)
```

### remove all containers
```bash
docker rm -f $(docker ps -qa)
```

### show logs
```bash
docker log [container_id]
```

### stop container
```bash
docker stop [container_name]
```

### show docker version
```bash
docker version
```

### build image
```bash
docker build -t [name/tag] .
```

### expose port when running a container
```bash
docker run -it -p [host port number]:[container port number] [name/tag] /bin/bash
```

run command
---
```bash
docker run [args] image:tag [command] [args]
```

run command with explanation
---
```bash
docker run -d -p 3000:3000 --link db:postgres manual_web rails s -b '0.0.0.0'

-d (run as daemon)
-p 3000:3000 (expose host_port:container_port)
--link db:postgres (link database_container:link_name)
manual_web (image name)
rails s -b '0.0.0.0' (command to execute)
```

start a stopped container
---
```bash
docker start [container_id|container_name]
```

launch shell of a running container
---
```bash
docker exec -it [container_id] /bin/bash
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

docker commit container_id
docker tag image_id new_image_name
docker push username/my_new_image

docker info
docker ps -a
docker images
docker run -i -t ubuntu:12.10 /bin/bash
docker diff
docker commit id_number chickenriceplatter/custom-image-name # create custom image
docker push chickenriceplatter/custom-image-name # goto: index.docker.io
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
```

Install on Arch
===
```
$ sudo pacman -S docker
```

start docker daemon on boot
---
```
$ sudo systemctl enable docker
```

stop docker daemon from starting on boot
---
```
$ sudo systemctl disable docker
```

manage docker as non-root user
---
```
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
```