FROM ubuntu:14.04.2
MAINTAINER SungKwang Song <saltfactory@gmail.com>

RUN cd /etc/apt && \
     sed -i 's/archive.ubuntu.com/ftp.daum.net/g' sources.list

RUN apt-get update
RUN apt-get install -y tree gpa

#RUN mv /dev/random /dev/random.bak
#RUN mv /dev/urandom /dev/random

RUN mkdir /data
RUN echo "gpg demo data" > /data/seed.data
