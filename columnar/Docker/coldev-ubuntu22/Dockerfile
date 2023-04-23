FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && \
    apt-get -y install tzdata && \
    apt-get -y --force-yes install build-essential automake libboost-all-dev bison cmake libncurses5-dev libreadline-dev libperl-dev libssl-dev libxml2-dev libkrb5-dev flex libpam-dev git vim less atop libreadline-dev zlib1g-dev rsync && \
    apt-get -y update && apt-get install -y --force-yes wget strace ltrace gdb bsdmainutils libsnappy-dev libjemalloc-dev pkg-config rsyslog net-tools ssh expect iputils-ping libcurl4-openssl-dev && \
    apt-get -y install gcc g++ && \
    apt-get install -y --force-yes libdbi-perl sudo && \
    apt-get install --reinstall -y locales && \
    sed -i 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen ru_RU.UTF-8 
#RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 800 --slave /usr/bin/g++ g++ /usr/bin/g++-9
ENV LANG ru_RU.UTF-8  
ENV LANGUAGE ru_RU  
ENV LC_ALL ru_RU.UTF-8  
#RUN dpkg-reconfigure --frontend noninteractive locales
ADD .vimrc /root/
ADD .gdbinit /root/
RUN echo '. /usr/local/mariadb/columnstore/bin/columnstoreAlias' >> /root/.bashrc && \
#    echo 'alias enable_log="for f in $(ma getprocessconfig | grep ProcessName | cut -d= -f2 | paste -s); do ma setprocessconfig $f pm LogFile on; done"' >> /root/.bashrc && \
    echo 'alias dev="cd /git/mdb-server/storage/columnstore/"' >> /root/.bashrc && \
    echo 'export PATH=$PATH:/git/cs-docker-tools/shells' >> /root/.bashrc
