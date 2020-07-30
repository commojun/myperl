FROM perl:5.30-buster
MAINTAINER commojun

ENV TZ Asia/Tokyo

# set timezone
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# install various packages
RUN apt update -y && apt install -y patch build-essential locales dstat git ngrep tar jq libssl-dev libncurses5-dev libreadline6-dev

# locale setting
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# install Carton
RUN cpanm Carton

# 調査用
RUN cpanm V Caroline Reply

# create user
RUN useradd -u 1000 -k /etc/skel/ -m app -s /bin/bash

USER app
ENV USER app
ENV HOME /home/app

ENV PATH /usr/local/perl/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin

WORKDIR /home/app

# for reply
COPY .replyrc /home/app/
RUN echo 'alias reply="PERL_RL=Caroline reply"' >> ~/.bashrc

