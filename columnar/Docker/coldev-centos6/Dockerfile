FROM centos:centos6
RUN yum -y groupinstall "Development Tools" \
    && yum -y install bison ncurses-devel readline-devel perl-devel openssl-devel cmake libxml2-devel gperf libaio-devel libevent-devel python-devel ruby-devel tree wget pam-devel snappy-devel libicu \
    && yum -y install vim wget strace ltrace gdb  rsyslog net-tools openssh-server expect boost perl-DBI libicu boost-devel initscripts
ADD .vimrc /root/
ADD .gdbinit /root/
RUN echo '. /usr/local/mariadb/columnstore/bin/columnstoreAlias' >> /root/.bashrc && \
#    echo 'alias enable_log="for f in $(ma getprocessconfig | grep ProcessName | cut -d= -f2 | paste -s); do ma setprocessconfig $f pm LogFile on; done"' >> /root/.bashrc && \
    echo "alias mkinstall=\"make -j8 && make -j8 install && /usr/local/mariadb/columnstore/bin/postConfigure\"" >> /root/.bashrc && \
    echo 'alias reinstall="echo y | ma shut && make -j8 && make -j8 install && echo -e \"1\\n\\n\\n\\n\" | /usr/local/mariadb/columnstore/bin/postConfigure"' >> /root/.bashrc && \
    echo 'alias reg_calp="pushd . && cd /git/mariadb-columnstore-regression-test/mysql/queries/working_tpch1_compareLogOnly"' >> /root/.bashrc && \
    echo 'alias d1="pushd . && cd /git/mariadb-columnstore-server/d1-mariadb-columnstore-engine/"' >> /root/.bashrc && \
    echo 'alias d2="pushd . && cd /git/mariadb-columnstore-server/d2-mariadb-columnstore-engine/"' >> /root/.bashrc && \
    echo 'alias sreinstall1="stopcs && cp /usr/local/mariadb/columnstore/etc/Columnstore.xml /Columnstore.xml && pushd . && d1 && make -j8 && make -j8 install && cp /Columnstore.xml /usr/local/mariadb/columnstore/etc/Columnstore.xml && startcs && popd"' >> /root/.bashrc && \
    echo 'alias sreinstall2="stopcs && cp /usr/local/mariadb/columnstore/etc/Columnstore.xml /Columnstore.xml && pushd . && d2 && make -j8 && make -j8 install && cp /Columnstore.xml /usr/local/mariadb/columnstore/etc/Columnstore.xml && startcs && popd"' >> /root/.bashrc && \
    echo 'export PATH=$PATH:/git/cs-docker-tools/shells' >> /root/.bashrc
