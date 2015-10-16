FROM poolingpeople/wildfly:8.1-8_45
ENV neo4j pp-neo-st

ADD standalone.conf /opt/jboss/wildfly/bin/
ADD standalone.xml /opt/jboss/wildfly/standalone/configuration/

RUN /opt/jboss/wildfly/bin/add-user.sh ppuser ppuser0000. --silent
ADD *.war /opt/jboss/wildfly/standalone/deployments/
EXPOSE 3614
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]