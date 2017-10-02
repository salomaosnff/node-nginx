FROM node:alpine

ENV PORT 8080
ENV NODE_ENV production
ENV S6_VERSION v1.20.0.0

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-amd64.tar.gz /tmp

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /
RUN apk add --update --no-cache nginx
RUN mkdir /app

ADD rootfs /

WORKDIR /app

ENTRYPOINT [ "/init" ]

CMD ["node"]

EXPOSE 80 443