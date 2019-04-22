FROM alpine:latest

ENTRYPOINT [ "/usr/sbin/crond", "-f" ]
