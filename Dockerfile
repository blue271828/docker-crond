FROM alpine:latest
LABEL maintainer="blue271828"

COPY entrypoint.sh /
ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
