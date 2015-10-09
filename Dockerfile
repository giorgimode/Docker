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
     
     RUN (curl -L -k -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/server-jre-8u60-linux-x64.tar.gz | gunzip -c | tar x) \
    && mv /jdk1.8.0_60 /opt/jdk
ENV JAVA_HOME /opt/jdk
ENV JRE_HOME  $JAVA_HOME/jre
ENV PATH $PATH:$JAVA_HOME/bin
    
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