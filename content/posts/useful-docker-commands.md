+++
title = "Collection of useful docker commands."
date = "2019-07-23T12:12:03.284Z"
author = "b0wter"
cover = ""
tags = ["shell", "docker"]
description = ""
showFullContent = false
+++

This is a collection of useful docker commands I found/made/discovered/whatever durint my time with docker:

## Docker disk usage
I've had a time where my server's disk was runnig full despite very low usage. I quickly found that docker was the culprit but I didn't know which container to blame. Use the following command to print detailed stats:
```
$ docker system df -v

Images space usage:

REPOSITORY            TAG                 IMAGE ID            CREATED ago         SIZE                SHARED SIZE         UNIQUE SiZE         CONTAINERS
nginx                 latest              98ebf73aba75        5 days ago ago      109.4MB             109.4MB             0B                  0
pihole/pihole         latest              fca6b27ec397        3 weeks ago ago     297.4MB             55.28MB             242.1MB             0
b0wter/torpedo        latest              9486b5b12d2b        3 weeks ago ago     272.1MB             55.28MB             216.8MB             1

Containers space usage:

CONTAINER ID        IMAGE                  COMMAND                  LOCAL VOLUMES       SIZE                CREATED ago         STATUS                  NAMES
20c2878e23bb        b0wter/lebesmart       "nginx -g 'daemon of…"   0                   2B                  2 days ago ago      Up 2 days               nginx_test_container
5c6ced0703da        b0wter/torpedo         "dotnet torpedo.dll"     0                   0B                  8 days ago ago      Up 7 days               mytorpedo
7a615bec4c2f        pihole/pihole:latest   "/s6-init"               0                   452GB               15 hours ago ago    Up 15 hours (healthy)   pihole
```

## Stop all containers
```
docker stop $(docker ps -a -q)
```

## Remove all containers
This will delete only stopped containers.
```
docker rm $(docker ps -a -q)
```

## Remove all images
This will delete only images not in use.
```
docker rmi $(docker images -q)
```