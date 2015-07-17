FROM phusion/baseimage:0.9.16
MAINTAINER Jorge Romero <romeroqj@gmail.com>

RUN apt-get update
RUN apt-get install -y memcached nginx postgresql python python-pip redis-server
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#ADD conf/nginx.conf /etc/nginx/nginx.conf
#ADD conf/gunicorn.conf /etc/gunicorn.conf

RUN adduser --create-home --home-dir /application application
RUN usermod -a -G sudo application

EXPOSE 80

CMD ["/sbin/my_init"]


# TODO: Move pid and sock files to /var/run

# NOTES
# Command to run container locally during development:
# docker run -i -t --rm -v "$(pwd):/app" romeroqj/wsgi entry.sh