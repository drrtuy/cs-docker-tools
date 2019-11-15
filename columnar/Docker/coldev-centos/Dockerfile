FROM centos:centos7
RUN sed -i 's/^override_install_langs=en_US.utf8/#override_install_langs=en_US.utf8/' /etc/yum.conf \
    && yum makecache fast \
    && yum -y install glibc-common
ENV LANG ru_RU.UTF-8  
ENV LANGUAGE ru_RU  
ENV LC_ALL ru_RU.UTF-8 
RUN yum -y install epel-release \
    && yum -y groupinstall "Development Tools" \
    && yum -y install bison ncurses-devel readline-devel perl-devel openssl-devel cmake libxml2-devel gperf libaio-devel libevent-devel python-devel ruby-devel tree wget pam-devel snappy-devel libicu \
    && yum -y install vim wget strace ltrace gdb  rsyslog net-tools openssh-server expect boost perl-DBI libicu boost-devel initscripts jemalloc-devel libcurl-devel cppunit-devel
ADD .vimrc /root/
ADD .gdbinit /root/
RUN echo '. /usr/local/mariadb/columnstore/bin/columnstoreAlias' >> /root/.bashrc && \
    echo 'export PATH=$PATH:/git/cs-docker-tools/shells' >> /root/.bashrc && \
    echo 'alias reg_calp="pushd . && cd /git/mariadb-columnstore-regression-test/mysql/queries/"' >> /root/.bashrc
