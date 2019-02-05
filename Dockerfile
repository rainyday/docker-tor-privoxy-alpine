FROM alpine:3.8

EXPOSE 8118 9050 8080

RUN apk --update add privoxy tor runit tini

COPY service /etc/service/

RUN install -d -o tor -m 700 /data

VOLUME [ "/data" ]

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
