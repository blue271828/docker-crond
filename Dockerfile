FROM alpine:latest
LABEL maintainer="blue271828"

ENV LOG_LEVEL=8

COPY entrypoint.sh /
ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
