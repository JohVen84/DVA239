#!/bin/bash

docker build -t "project" .

image=$(docker image ls --filter "reference=*project*" -q)

docker run -i -t $image /bin/bash
