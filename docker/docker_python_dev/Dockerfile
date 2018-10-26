FROM alpine:latest

# Setup
RUN apk update
RUN apk upgrade
RUN apk add --update python3 python3-dev postgresql-client postgresql-dev build-base gettext emacs
RUN python3 -m ensurepip && pip3 install --upgrade pip
RUN pip3 install --upgrade ipython pipenv

# Initialize
RUN mkdir -p /src
WORKDIR /src

# RUN
CMD ["sh"]
# $ docker run -ti --rm -v $(pwd):/src marcolancini/python_devel