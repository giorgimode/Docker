# Docker Base Image

This image includes any tool or application, not explicitly required for the Linux administration, that is present in mostly all the required subimages in order to reduce the number of Docker hierarchies.

## Description

#### Following software and tools are to be installed on the Docker-Base:  
Ubuntu server (LTS)  
OpenSSH  
Java 8  
Git  
Nano  
NMAP / Traceroute  
ping / grep / sed / find / wget  
curl  
Ngrep  
tar / untar / zip / unzip  
jjs  

####Following ports are exposed:
ssh (22)  
sftp (22)  
jmx (1099)  

####Following configs are set:
A root user with a given password. Can not be logged through SSH.  
An admin user with a given password. Can be logged through SSH. Admin user is sudoer  


## Usage
#### To run an interactive shell in the Ubuntu image:  
```
docker run -p 42222:22 -i -t docker-base /bin/bash  
```

####To run in background
```
docker run -d -P -p 42222:22 --name base_docker_container docker-base
```

####SSH to docker
```
ssh admin@0.0.0.0 -p 42222  
```
https://docs.docker.com/examples/running_ssh_service/ 




