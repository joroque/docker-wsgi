FROM centos:7
MAINTAINER Jorge Romero <romeroqj@gmail.com>

ADD . /srv
WORKDIR /srv

# TODO: Investigate if yum update is really necessary
#RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y nginx python-virtualenv python-pip

# Copy configuration files
RUN rm -rf /etc/nginx/nginx.conf
RUN ln -s /srv/nginx.conf /etc/nginx/nginx.conf

# TODO: Copy scripts to $PATH
# For example:
RUN ln -s /srv/start.sh /usr/local/bin/start.sh

# Create Python virtual environment
RUN virtualenv venv

EXPOSE 80

CMD bash -C '/srv/start.sh';'bash'