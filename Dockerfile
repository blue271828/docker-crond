FROM alpine:3.9.3
LABEL maintainer="blue271828"

RUN apk --update --no-cache add \
    docker \
    tzdata

COPY entrypoint.sh /
RUN chmod 400 /entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
