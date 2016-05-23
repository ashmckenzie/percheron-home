FROM gliderlabs/alpine
MAINTAINER ash@the-rebellion.net

RUN apk add --update coreutils bash tar openssl haproxy iptables curl

RUN mkdir -p /usr/local/bin /etc/haproxy /app

ENV TIMESTAMP 1449564275

RUN wget https://github.com/chrismytton/shoreman/raw/master/shoreman.sh -O /usr/local/bin/shoreman
RUN cd /usr/local/bin && wget https://releases.hashicorp.com/consul-template/0.11.1/consul-template_0.11.1_linux_amd64.zip ; unzip consul-template_0.11.1_linux_amd64.zip ; rm -f consul-template_0.11.1_linux_amd64.zip

ADD config/ssl.* /etc/haproxy/
RUN cat /etc/haproxy/ssl* > /etc/haproxy/ssl.pem

ADD config/reload_haproxy.sh /app/reload_haproxy.sh
ADD config/haproxy.cfg.ctmpl /app/haproxy.cfg.ctmpl
ADD config/Procfile /app/Procfile
ADD config/start /start

RUN sed -i 's%<ADMIN_PASSWORD>%{{ secrets.haproxy.admin_password }}%' /app/haproxy.cfg.ctmpl

RUN chmod 755 /start /usr/local/bin/shoreman /app/reload_haproxy.sh

WORKDIR /app

EXPOSE 80 443 1234

VOLUME [ "/var/log" ]

ENTRYPOINT [ "/start" ]
