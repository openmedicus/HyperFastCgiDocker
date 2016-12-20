all: build tag push

pull:
	sudo docker pull centos:7

build:
	sudo docker build -t centos-servicestack .

tag:
	sudo docker tag centos-servicestack openmedicus/centos-servicestack:latest

push:
	sudo docker push openmedicus/centos-servicestack

