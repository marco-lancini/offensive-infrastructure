FROM alpine:latest

# Install dependencies
RUN apk update && \
    apk upgrade &&  \
    apk add --no-cache --update ansible libffi-dev py-netaddr openssh sshpass zip jq
WORKDIR /src
# RUN
CMD ["/bin/sh"]

# $ docker run -ti --rm -v $(pwd):/src marcolancini/ansible_worker