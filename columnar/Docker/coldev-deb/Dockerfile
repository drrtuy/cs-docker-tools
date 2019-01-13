FROM debian:8
RUN apt-get -y update && apt-get -y --force-yes install build-essential automake libboost-all-dev bison cmake libncurses5-dev libreadline-dev libperl-dev libssl-dev libxml2-dev libkrb5-dev flex libpam-dev git vim less atop libreadline-dev zlib1g-dev && \
    apt-get -y update && apt-get install -y --force-yes wget strace ltrace gdb bsdmainutils libsnappy-dev libjemalloc-dev pkg-config rsyslog net-tools ssh expect iputils-ping libcurl4-openssl-dev && \
    apt-get install --reinstall -y locales && \
    sed -i 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen ru_RU.UTF-8
ENV LANG ru_RU.UTF-8  
ENV LANGUAGE ru_RU  
ENV LC_ALL ru_RU.UTF-8  
RUN dpkg-reconfigure --frontend noninteractive locales
ADD .vimrc /root/
ADD .gdbinit /root/
RUN echo '. /usr/local/mariadb/columnstore/bin/columnstoreAlias' >> /root/.bashrc && \
    echo 'alias enable_log="for f in $(ma getprocessconfig | grep ProcessName | cut -d= -f2 | paste -s); do ma setprocessconfig $f pm LogFile on; done"' >> /root/.bashrc && \
    echo "alias mkinstall=\"make -j8 && make -j8 install && /usr/local/mariadb/columnstore/bin/postConfigure\"" >> /root/.bashrc && \
    echo 'alias reinstall="echo y | ma shut && make -j8 && make -j8 install && echo -e \"1\\n\\n\\n\\n\\" | /usr/local/mariadb/columnstore/bin/postConfigure"' >> /root/.bashrc && \
    echo 'export PATH=$PATH:/git/cs-docker-tools/shells' >> /root/.bashrc 
