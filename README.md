# hyperfastcgi

CentOS 7 container with Mono and HyperFast CGI 4

Will allow you to run docker container with ServiceStack webservices.

Docker image is here: https://hub.docker.com/r/openmedicus/hyperfastcgi/

### Pull and run

> docker pull openmedicus/hyperfastcgi

Now you can run it

> docker run -d -v /www/ws1:/var/www:ro -p 9000:9000 hyperfastcgi

This will use your ServiceStack webservice in '/www/ws1'.

You can start multple docker container ex:

> docker run -d -v /www/ws2:/var/www:ro -p 9001:9000 hyperfastcgi

### Systemd

/etc/systemd/system/docker-servicestack.service
```
[Unit]
Description=ServiceStack Container
Requires=docker.service
After=docker.service

[Service]
Restart=always
ExecStart=/usr/bin/docker run --name=servicestack1 -v /www/ws1:/var/www:ro -p 9000:9000 docker.io/openmedicus/hyperfastcgi
ExecStop=/usr/bin/docker stop -t 2 servicestack1
ExecStopPost=/usr/bin/docker rm -f servicestack1

[Install]
WantedBy=default.target
```

Now reload systemd, enable and start
```
# systemctl daemon-reload
# systemctl enable docker-servicestack
# systemctl start docker-servicestack
```


### Create your own Docker Container

Dockerfile
```
FROM docker.io/openmedicus/hyperfastcgi
MAINTAINER Your Name <your_name@your_domain.com>

ADD your_ws_folder /var/www/
```

### Please comment on:

https://github.com/openmedicus/hyperfastcgi

