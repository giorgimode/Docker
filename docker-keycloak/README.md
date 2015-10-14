# Keycloak Auth Server Docker image with Examples

This image prepares a basic Keycloak Auth Server and deploys the examples.

## Usage

To boot in standalone mode

    docker run jboss/keycloak-examples

Domain mode is not supported on this version, as this image ships with a custom standalone.xml file. 

Once it boots, you can login using admin/admin for the first login on the [Auth server](http://localhost:8080/auth/admin/) or as bburke@redhat.com/password on the [Customer Portal sample application](http://localhost:8080/customer-portal/customers/view.jsp) 


This is a set of Docker images related to Keycloak. 

- [keycloak](https://registry.hub.docker.com/u/jboss/keycloak/) example Keycloak server
- [keycloak-mysql](https://registry.hub.docker.com/u/jboss/keycloak-mysql/) example connecting Keycloak to MySQL
- [keycloak-postgres](https://registry.hub.docker.com/u/jboss/keycloak-postgres/) example connecting Keycloak to PostgreSQL
- [keycloak-adapter-wildfly](https://registry.hub.docker.com/u/jboss/keycloak-adapter-wildfly/) builds on top of the [jboss/wildfly](https://registry.hub.docker.com/u/jboss/wildfly/) image, adding the Keycloak adapter for Wildfly to it, as well as the required changes to the standalone.xml
- [keycloak-examples](https://registry.hub.docker.com/u/jboss/keycloak-examples/) builds on top of [keycloak](https://registry.hub.docker.com/u/jboss/keycloak/), adding the examples.

