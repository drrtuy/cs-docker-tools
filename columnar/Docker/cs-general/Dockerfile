FROM ubuntu:xenial
RUN apt-get -y update && apt-get -y --force-yes install tzdata libtcl8.6 expect perl openssl file sudo libdbi-perl libboost-all-dev libreadline-dev rsync libsnappy1v5 snappy net-tools
RUN apt-get install --reinstall -y locales
RUN sed -i 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen
RUN locale-gen ru_RU.UTF-8
ENV LANG ru_RU.UTF-8  
ENV LANGUAGE ru_RU  
ENV LC_ALL ru_RU.UTF-8  
RUN dpkg-reconfigure --frontend noninteractive locales
RUN apt-get -y --force-yes install syslog-ng
#ADD .vimrc /root/
#ADD .ssh /root/
