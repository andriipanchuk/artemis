# Pulling default image from DockerHub
FROM python:latest

MAINTAINER Farkhod Sadykov sadykovfarkhod@gmail.com

## Copy everything to image folder root
WORKDIR /app
COPY . /app

## Docker build is required argument "branch_name" value should be master|qa|dev
ARG branch_name
ENV BRANCH_NAME=$branch_name

## Create kube folder insied root Copy KuberConfig to the docker images
RUN mkdir /root/.kube


## Install all requirements to the docker image
RUN python -m pip install -r requirements.txt


## Expose the port 5000
EXPOSE 5000

## Install kubectl and make sure excecutable
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

## To run this docker image need commmand
# CMD ['python', '/app/artemis.py']
