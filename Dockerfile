FROM phusion/baseimage:0.9.16
MAINTAINER Jorge Romero <romeroqj@gmail.com>

#-------------------------------------------------------------------------------#
# INSTALL DEPENDENCIES
#

RUN apt-get update
RUN apt-get install -y memcached nginx postgresql python python-pip redis-server
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# TODO: Move to uWSGI. I don't like doing this. All Python dependencies should
# be installed during container runtime with pip.
# See http://cerebralmanifest.com/uwsgi-vs-gunicorn/
RUN pip install gunicorn

#-------------------------------------------------------------------------------#
# CONFIGURE SERVICES
#
# This base image uses runit (http://smarden.org/runit/), which replaces upstart
# as init daemon. A service is just a folder under /etc/service that contains a
# shell script named 'run'. This script must be executable.
#

# Nginx
ADD runit/nginx /etc/service/nginx
RUN rm -rf /etc/nginx/nginx.conf
ADD etc/nginx.conf /etc/nginx/nginx.conf

# Gunicorn
ADD runit/gunicorn /etc/service/gunicorn
RUN mkdir /etc/gunicorn
ADD etc/gunicorn.conf /etc/gunicorn/gunicorn.conf


#-------------------------------------------------------------------------------#
# DEPLOY APPLICATION
#

RUN mkdir /srv/application
ADD wsgi.py /srv/application/wsgi.py







#ADD service/memcached /etc/service/memcached
#ADD service/postgres /etc/service/postgrese
#ADD service/redis /etc/service/redis


#RUN adduser --create-home --home-dir /application application
#RUN usermod -a -G sudo application

EXPOSE 80

CMD ["/sbin/my_init"]


# TODO: Move pid and sock files to /var/run

# NOTES
# Command to run container locally during development:
# docker run -i -t --rm -v "$(pwd):/app" romeroqj/wsgi entry.sh