FROM docker-base

ENV KEYCLOAK_VERSION 1.5.0.Final

USER root

# RUN apt-get update && apt-get -y install maven && apt-get clean all
RUN apt-get update && apt-get install -y jq && apt-get -y install maven && apt-get clean all

RUN groupadd -r jboss -g 4000 && useradd -u 4000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss && \
    chmod 755 /opt/jboss
    
USER jboss

RUN cd /opt/jboss/ && curl -L https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/keycloak-$KEYCLOAK_VERSION.tar.gz | tar zx && mv /opt/jboss/keycloak-$KEYCLOAK_VERSION /opt/jboss/keycloak

ADD setLogLevel.xsl /opt/jboss/keycloak/
RUN java -jar /usr/share/java/saxon.jar /opt/jboss/keycloak/standalone/configuration/standalone.xml /opt/jboss/keycloak/setLogLevel.xsl >/opt/jboss/keycloak/standalone/configuration/standalone-temp.xml
RUN mv /opt/jboss/keycloak/standalone/configuration/standalone-temp.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml

ENV JBOSS_HOME /opt/jboss/keycloak

EXPOSE 8080

CMD ["/opt/jboss/keycloak/bin/standalone.sh", "-b", "0.0.0.0"]