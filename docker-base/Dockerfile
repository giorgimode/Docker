FROM ubuntu:14.04.3

RUN echo 'root:password' | chpasswd
RUN groupadd admin -g 1000 && \
    useradd -u 1000 -g admin -m -c "Admin user" admin
RUN sudo adduser admin sudo
RUN echo 'admin:password' | chpasswd

  RUN apt-get update  \
      &&  apt-get install -y openssh-server \
    && apt-get install -y    nano \
    &&  apt-get install -y   wget \
    && apt-get install -y    nmap \
    && apt-get install -y     sed \
   &&  apt-get install -y    curl \
   &&  apt-get install -y     tar \
   &&  apt-get install -y    zip \
   && apt-get install -y     unzip \
   && apt-get install -y git \
   && apt-get install -y traceroute \
   && apt-get install -y grep \
    && apt-get install -y ngrep
     
     RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main"\
    > /etc/apt/sources.list.d/webupd8team-java.list \
    && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main"\
    >> /etc/apt/sources.list.d/webupd8team-java.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
    && apt-get update -y \
    && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
    && apt-get install -y --no-install-recommends oracle-java8-installer=8u60+8u60arm-1~webupd8~1 \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# set environment
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
    
 RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*      
 
USER root
RUN echo "DenyUsers root" | tee -a /etc/ssh/ssh_config 


RUN mkdir /var/run/sshd
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22 1099

CMD ["/usr/sbin/sshd", "-D"]