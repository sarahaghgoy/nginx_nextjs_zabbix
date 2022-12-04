#!/bin/bash
sudo apt-get update -y && sudo apt-get install curl -y
while :
  do
    sleep 30
    if curl http://0.0.0.0:80/ > /dev/null ; then
      echo "Web server is up and running"
    else
      echo "Web server failure"
    fi
  done
