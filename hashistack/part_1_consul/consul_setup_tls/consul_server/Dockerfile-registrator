FROM registrator:dev
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY ./config/ssl/consul_ca.pem /usr/local/share/ca-certificates/consul_ca.pem
COPY ./config/ssl/server.pem /usr/local/share/ca-certificates/server.pem
RUN update-ca-certificates