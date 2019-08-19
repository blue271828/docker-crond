FROM alpine:3.9.3
LABEL maintainer="blue271828"

ARG DOCKER_CLI_VERSION="18.09.8"
ENV DOCKER_CLI_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLI_VERSION.tgz"

RUN apk --update --no-cache add \
    curl \
    tzdata

RUN curl -L $DOCKER_CLI_URL | tar -zx -C /tmp/ \
    && mv /tmp/docker/docker /usr/local/bin/ \
    && rm -rf /tmp/docker

COPY entrypoint.sh /
RUN chmod 400 /entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
