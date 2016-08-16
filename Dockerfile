FROM centos:7
MAINTAINER Mikkel Kruse Johnsen <mikkel@xmedicus.com>

# install Fedora repo
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-6.noarch.rpm

# install Mono repo
RUN rpm -Uvh http://yum.xmedicus.com/opensource/rhel-7-x86_64/RPMS/openmedicus-release-rhel-2.0-1.noarch.rpm

# Update
RUN yum -y update

# Install net tools
RUN yum install -y net-tools

# install Mono
RUN yum install -y mono-complete

# install nginx and HyperFast CGI
RUN yum -y install nginx hyperfastcgi

# Clean yum
RUN yum clean all

ADD hfc.config /etc/hyperfastcgi/
ADD service.conf /etc/nginx/conf.d/

EXPOSE 80

# Start hyperfatcgi4 and nginx
CMD nginx && /usr/bin/hyperfastcgi4 /config=/etc/hyperfastcgi/hfc.config /stoppable=False

