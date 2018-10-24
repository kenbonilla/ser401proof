#!/bin/bash
#This is a proof of concept for using a script to start a web stack
#This stack contains apache httpd, mysql, and nginx

#detached mysql database on port 3306 with a random root password
docker container run -d -p 3306:3306 --name db -e MYSQL_RANDOM_ROOT_PASSWORD=yes mysql
#detached apache server with internal port 8080 and ext port 80
docker container run -d --name webserver -p 8080:80 httpd
#detached nginx load balancer on port 80
docker container run -d --name proxy  -p 80:80 nginx  


#should return for httpd and nginx
curl localhost:8080
curl localhost:80


#prints out what containers are running 
docker container ls

echo "Waiting for mysql to start..."
#fetches random root password and places it in log.txt
sleep 20 && x=$(docker container logs db)  &&  echo "$x" > log.txt