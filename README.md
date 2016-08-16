# centos-servicestack

CentOS container with Mono and HyperFast CGI 4

Will allow you to run docker container with ServiceStack webservices.

> docker run -ti -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /var/www:/var/www:ro -p 8080:80 centos-servicestack
