FROM gliderlabs/alpine
MAINTAINER ash@the-rebellion.net

RUN apk add --update bash tar openssl haproxy iptables

RUN mkdir -p /usr/local/bin /app

RUN wget https://github.com/chrismytton/shoreman/raw/master/shoreman.sh -O /usr/local/bin/shoreman
RUN cd /usr/local/bin && wget https://github.com/hashicorp/consul-template/releases/download/v0.10.0/consul-template_0.10.0_linux_amd64.tar.gz -O - | tar --strip-components=1 -xzvf -

ADD config/reload_haproxy.sh /app/reload_haproxy.sh
ADD config/haproxy.cfg.ctmpl /app/haproxy.cfg.ctmpl
ADD config/Procfile /app/Procfile
ADD config/start /start

RUN chmod 755 /start /usr/local/bin/shoreman /app/reload_haproxy.sh

WORKDIR /app

EXPOSE 80 443 1234

VOLUME [ "/var/log" ]

ENTRYPOINT [ "/start" ]
