FROM centos:7
MAINTAINER Jorge Romero <romeroqj@gmail.com>

ADD . /srv/docker-wsgi
WORKDIR /srv/docker-wsgi

#RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y python-virtualenv python-pip

RUN yum install -y nginx
RUN rm -rf /etc/nginx/nginx.conf
RUN ln -s /srv/docker-wsgi/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["./start.sh"]