#!/bin/bash

x=$(docker container logs db)
echo "$x" > log.txt


# docker rm -f $(docker ps -a -q)

