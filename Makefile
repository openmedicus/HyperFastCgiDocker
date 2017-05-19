all: pull build tag push

pull:
	sudo docker pull centos:7

build:
	sudo docker build -t hyperfastcgi .

tag:
	sudo docker tag hyperfastcgi openmedicus/hyperfastcgi:latest

push:
	sudo docker push openmedicus/hyperfastcgi

