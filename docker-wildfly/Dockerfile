FROM docker-base

##add jboss config
RUN groupadd -r -f jboss -g 2000 && useradd -u 2000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss

# Set the working directory to jboss' user home directory
WORKDIR /opt/jboss

# Set the WILDFLY_VERSION env variable
USER jboss
ENV WILDFLY_VERSION 8.2.0.Final
USER jboss
RUN cd $HOME && wget http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz 

# Specify the user which should be used to execute all commands below
USER jboss
# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
RUN cd $HOME
RUN tar -zxvf wildfly-$WILDFLY_VERSION.tar.gz
RUN mv $HOME/wildfly-$WILDFLY_VERSION $HOME/wildfly

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/jboss/wildfly

# Expose the ports we're interested in
EXPOSE 8080 9990

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]



