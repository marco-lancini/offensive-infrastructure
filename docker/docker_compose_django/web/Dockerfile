FROM alpine

# Initialize
RUN mkdir -p /data/web
WORKDIR /data/web
COPY requirements.txt /data/web/

# Setup
RUN apk update
RUN apk upgrade
RUN apk add --update python2 python2-dev py2-pip postgresql-client postgresql-dev build-base gettext
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Clean
RUN apk del -r python2-dev postgresql

# Prepare
COPY . /data/web/
RUN mkdir -p webapp/static/admin
