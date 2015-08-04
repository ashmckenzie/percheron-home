FROM gliderlabs/alpine
MAINTAINER ash@the-rebellion.net

RUN apk add --update haproxy

ADD config/haproxy.cfg /etc/haproxy/haproxy.cfg

EXPOSE 80 443 1234

VOLUME [ "/var/log"]

CMD [ "/usr/sbin/haproxy", "-V", "-db", "-f", "/etc/haproxy/haproxy.cfg" ]
