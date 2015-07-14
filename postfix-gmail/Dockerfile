FROM ubuntu:14.04.2
MAINTAINER SungKwang Song <saltfactory@gmail.com>

RUN cd /etc/apt && \
     sed -i 's/archive.ubuntu.com/ftp.daum.net/g' sources.list

RUN apt-get update

RUN apt-get install -y mailutils ca-certificates

ADD ./main.cf /etc/postfix/main.cf
ADD ./sasl_passwd /etc/postfix/sasl_passwd
ADD ./aliases /etc/aliases

RUN chmod 400 /etc/postfix/sasl_passwd
RUN postmap /etc/postfix/sasl_passwd
RUN cp /etc/ssl/certs/Thawte_Premium_Server_CA.pem /etc/postfix/cacert.pem
RUN newaliases

RUN apt-get install -y language-pack-ko
RUN locale-gen ko_KR.UTF-8
RUN update-locale LANG=ko_KR.UTF-8
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

RUN echo "*.*;mail.none;mail.error;auth,authpriv.none             -/var/log/syslog" > /etc/rsyslog.d/postfix.conf


