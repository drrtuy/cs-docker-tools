FROM centos:centos7
RUN sed -i 's/^override_install_langs=en_US.utf8/#override_install_langs=en_US.utf8/' /etc/yum.conf
RUN yum -y reinstall glibc-common
ENV LANG ru_RU.UTF-8  
ENV LANGUAGE ru_RU  
ENV LC_ALL ru_RU.UTF-8  
RUN yum -y groupinstall "Development Tools"
RUN yum -y install bison ncurses-devel readline-devel perl-devel openssl-devel cmake libxml2-devel gperf libaio-devel libevent-devel python-devel ruby-devel tree wget pam-devel snappy-devel
RUN yum -y install vim wget strace ltrace gdb  rsyslog net-tools openssh-server expect
ADD .vimrc /root/
ADD .ssh /root/
