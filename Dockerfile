FROM alpine:edge

ENV TIMEZONE Asia/Tokyo

# hadolint ignore=DL3018,DL3028
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache --update add tzdata ruby-json sqlite-libs ca-certificates && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    apk --no-cache add --virtual build-deps \
        build-base ruby-dev sqlite-dev && \
    gem install --no-document twitter-text -v "1.14.2" && \
    gem install --no-document atig && \
    apk del tzdata build-deps && \
    rm -rf /var/cache/apk/*

EXPOSE 16668

ENTRYPOINT [ "atig", "-d", "-h" ]
CMD ["localhost"]

