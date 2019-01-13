FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && \
    apt-get -y install tzdata && \
    apt-get -y --force-yes install build-essential automake libboost-all-dev bison cmake libncurses5-dev libreadline-dev libperl-dev libssl-dev libxml2-dev libkrb5-dev flex libpam-dev git vim less atop libreadline-dev zlib1g-dev && \
    apt-get -y update && apt-get install -y --force-yes wget strace ltrace gdb bsdmainutils libsnappy-dev libjemalloc-dev pkg-config rsyslog net-tools ssh expect iputils-ping libcurl4-openssl-dev && \
    apt-get -y install gcc-8 g++-8 && \
    apt-get install -y --force-yes libdbi-perl sudo && \
    apt-get install --reinstall -y locales && \
    sed -i 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen ru_RU.UTF-8 
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8
ENV LANG ru_RU.UTF-8  
ENV LANGUAGE ru_RU  
ENV LC_ALL ru_RU.UTF-8  
#RUN dpkg-reconfigure --frontend noninteractive locales
ADD .vimrc /root/
ADD .gdbinit /root/
RUN echo '. /usr/local/mariadb/columnstore/bin/columnstoreAlias' >> /root/.bashrc && \
#    echo 'alias enable_log="for f in $(ma getprocessconfig | grep ProcessName | cut -d= -f2 | paste -s); do ma setprocessconfig $f pm LogFile on; done"' >> /root/.bashrc && \
    echo "alias mkinstall=\"make -j8 && make -j8 install && /usr/local/mariadb/columnstore/bin/postConfigure\"" >> /root/.bashrc && \
    echo 'alias reinstall="echo y | ma shut && make -j8 && make -j8 install && echo -e \"1\\n\\n\\n\\n\\" | /usr/local/mariadb/columnstore/bin/postConfigure"' >> /root/.bashrc && \
    echo 'alias reg_calp="pushd . && cd /git/mariadb-columnstore-regression-test/mysql/queries/working_tpch1_compareLogOnly"' >> /root/.bashrc && \
    echo 'alias d1="pushd . && cd /git/mariadb-columnstore-server/d1-mariadb-columnstore-engine/"' >> /root/.bashrc && \
    echo 'alias d2="pushd . && cd /git/mariadb-columnstore-server/d2-mariadb-columnstore-engine/"' >> /root/.bashrc && \
    echo 'alias sreinstall1="stopcs && cp /usr/local/mariadb/columnstore/etc/Columnstore.xml /Columnstore.xml && pushd . && d1 && make -j8 && make -j8 install && cp /Columnstore.xml /usr/local/mariadb/columnstore/etc/Columnstore.xml && startcs && popd"' >> /root/.bashrc && \
    echo 'alias sreinstall2="stopcs && cp /usr/local/mariadb/columnstore/etc/Columnstore.xml /Columnstore.xml && pushd . && d2 && make -j8 && make -j8 install && cp /Columnstore.xml /usr/local/mariadb/columnstore/etc/Columnstore.xml && startcs && popd"' >> /root/.bashrc && \
    echo 'export PATH=$PATH:/git/cs-docker-tools/shells' >> /root/.bashrc
