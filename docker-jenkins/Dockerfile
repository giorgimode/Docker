FROM docker-base

# install build tools for front and backend
RUN apt-get update\
  && apt-get install -y maven\
  && apt-get install nodejs nodejs-legacy npm ruby ruby-dev gem -y\
  && npm install -g grunt grunt-cli bower karma\
  && gem install sass compass\
  && rm -rf /var/lib/apt/lists/*

# setting environment vars
ENV JENKINS_HOME /var/jenkins_home

# Jenkins is ran with user `jenkins`, uid = 1000
# If you bind mount a volume from host/volume from a data container, 
# ensure you use same uid
RUN useradd -d "$JENKINS_HOME" -u 3000 -m -s /bin/bash jenkins

# Jenkins home directoy is a volume, so configuration and build history 
# can be persisted and survive image upgrades
VOLUME /var/jenkins_home

# `/usr/share/jenkins/ref/` contains all reference configuration we want 
# to set on a fresh new installation. Use it to bundle additional plugins 
# or config file with your custom jenkins Docker image.
RUN mkdir -p /usr/share/jenkins/ref/init.groovy.d

COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/tcp-slave-angent-port.groovy

# copy additional scripts
ENV HELPER_SCRIPTS /usr/share/jenkins/scripts
RUN mkdir $HELPER_SCRIPTS
COPY userScripts/* $HELPER_SCRIPTS/userScripts/
COPY userTemplates/wildfly/* $HELPER_SCRIPTS/userTemplates/wildfly/

# Jenkins version
#ENV JENKINS_VERSION 1.554.1
#ENV JENKINS_VERSION 1.580.3
ENV JENKINS_VERSION 1.596.2

# Get Jenkins
RUN curl -L http://mirrors.jenkins-ci.org/war-stable/$JENKINS_VERSION/jenkins.war -o /usr/share/jenkins/jenkins.war

ENV JENKINS_UC https://updates.jenkins-ci.org
RUN chown -R jenkins "$JENKINS_HOME" /usr/share/jenkins/ref

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

USER jenkins

COPY jenkins.sh /usr/local/bin/jenkins.sh
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]

# from a derived Dockerfile, can use `RUN plugin.sh active.txt` to setup /usr/share/jenkins/ref/plugins from a support bundle
COPY plugins.sh /usr/local/bin/plugins.sh