FROM gcc:latest
RUN apt-get -y update && apt-get -y --force-yes install build-essential automake libboost-all-dev bison cmake libncurses5-dev libreadline-dev libperl-dev libssl-dev libxml2-dev libkrb5-dev flex libpam-dev git vim less atop libreadline-dev zlib1g-dev
RUN apt-get -y update && apt-get install -y --force-yes wget strace ltrace gdb bsdmainutils libsnappy-dev libjemalloc-dev pkg-config rsyslog net-tools ssh expect iputils-ping 
ADD .vimrc /root/
ADD .ssh /root/
