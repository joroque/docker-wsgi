FROM centos:7
MAINTAINER Jorge Romero <romeroqj@gmail.com>

ADD . /srv/docker-wsgi
WORKDIR /srv/docker-wsgi

RUN yum update -y
RUN yum install -y epel-release
#RUN yum install -y python-virtualenv python-pip

RUN yum install -y nginx
RUN rm -rf /etc/nginx/nginx.conf
RUN ln -s /srv/docker-wsgi/nginx.conf /etc/nginx/nginx.conf

# TODO: Move this to run.sh
#RUN virtualenv .venv
#RUN source .venv/bin/activate
#RUN pip install -r requirements.txt

EXPOSE 80
EXPOSE 443

CMD ["/srv/docker-wsgi/run.sh"]