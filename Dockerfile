FROM alpine:3.9.3
LABEL maintainer="blue271828"

RUN apk --update --no-cache add tzdata

COPY entrypoint.sh /
ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
