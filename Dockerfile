FROM centos:7
MAINTAINER Jorge Romero <romeroqj@gmail.com>

ADD . /srv
WORKDIR /srv

# TODO: Investigate if yum update is really necessary
#RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y $(cat packages.txt)

# Copy scripts to $PATH
RUN cp bin/start.sh /usr/local/bin/start.sh

# Copy configuration files
RUN cp etc/nginx.conf /etc/nginx/nginx.conf
RUN cp etc/programs.ini /etc/supervisord.d/programs.ini

# Create Python virtual environment
RUN virtualenv venv
# TODO: Mimic what virtualenv does, set env variables

EXPOSE 80

CMD bash -C 'start.sh';'bash'

#TODO: Move pid and sock files to /var/run