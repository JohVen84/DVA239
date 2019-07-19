FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install dialog


ENV INSTALL_PATH /project
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH


COPY . $INSTALL_PATH
