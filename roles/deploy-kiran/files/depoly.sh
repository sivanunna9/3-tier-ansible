#!/bin/bash
set -u

tag=$1
var1='kiran'
IMGNAME=`docker ps | grep kiran | awk '{print $2}'`
#var2='siva'
#GITHASH=$(git rev-parse HEAD)
my_function () {
  aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 141693053937.dkr.ecr.us-east-2.amazonaws.com
  docker rmi -f $IMGNAME
  docker rm -f $1
  docker pull 141693053937.dkr.ecr.us-east-2.amazonaws.com/$1:$tag
  docker run -itd --name $1 -p 8080:8080 141693053937.dkr.ecr.us-east-2.amazonaws.com/$1:$tag

}


my_function $var1
#my_function $var2

