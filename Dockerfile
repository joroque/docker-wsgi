FROM centos:7
MAINTAINER Jorge Romero <romeroqj@gmail.com>


# OPS STUFF

ADD . /tmp
WORKDIR /tmp

# Install packages
RUN yum install -y epel-release
RUN yum install -y nginx python-pip redis sudo supervisor
RUN pip install gunicorn

# Copy scripts to $PATH
RUN cp ./bin/entry.sh /usr/local/bin/entry.sh
RUN cp ./bin/start.sh /usr/local/bin/start.sh

# Copy configuration files
RUN cp ./etc/nginx.conf /etc/nginx/nginx.conf
RUN cp ./etc/programs.ini /etc/supervisord.d/programs.ini

# Add user
RUN adduser --create-home --home-dir /app app
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


# # DEV STUFF

# ADD app/requirements.txt /app/requirements.txt
# WORKDIR /app
# RUN pip install -r /app/requirements.txt



EXPOSE 80

CMD bash -C 'entry.sh';'bash'

# TODO: Move pid and sock files to /var/run
# TODO: Investigate if yum update is really necessary

# NOTES
# Command to run container locally during development:
# docker run -i -t --rm -v "$(pwd):/app" romeroqj/wsgi entry.sh