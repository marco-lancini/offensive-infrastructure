FROM alpine:latest

# Install dependencies
RUN apk update && \
    apk upgrade &&  \
    apk add --no-cache --update ansible bash libffi-dev py-netaddr openssh sshpass zip
# Initialize
RUN mkdir -p /etc/ansible
RUN mkdir -p /playbooks
WORKDIR /playbooks
# RUN
CMD ["/bin/sh"]
