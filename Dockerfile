FROM jenkins:1.625.1
MAINTAINER tsukasa.tamaru<tsukasa.tamaru@2dfacto.co.jp>

USER root
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y sudo 
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN apt-get remove git

RUN rm -rf /var/lib/apt/lists/*

RUN git clone -b v2.6.2 https://github.com/git/git.git /usr/local/src/git
WORKDIR /usr/local/src/git
RUN make configure && \
    ./configure --prefix=/usr && \
    make && \
    make install
RUN rm -rf /usr/local/src/git

EXPOSE 8080:8080
EXPOSE 50000:50000
