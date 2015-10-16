docker-sonarqube
================

# How to use this image
##### Exposed Ports:  9000 (Http port), 9092(H2 Database port)  

## Run SonarQube

The server is started this way:

    docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube:5.1

To analyse a project:

    $ On Linux:
    mvn sonar:sonar

    $ With boot2docker:
    mvn sonar:sonar -Dsonar.host.url=http://$(boot2docker ip):9000 -Dsonar.jdbc.url="jdbc:h2:tcp://$(boot2docker ip)/sonar"

## Database configuration

By default the image will use an embedded H2 database that is not suited for production.

The production database is configured with theses variables:
`SONARQUBE_JDBC_USERNAME`, `SONARQUBE_JDBC_PASSWORD` and `SONARQUBE_JDBC_URL`.

    docker run -d --name sonarqube \
    -p 9000:9000 -p 9092:9092 \
    -e SONARQUBE_JDBC_USERNAME=sonar \
    -e SONARQUBE_JDBC_PASSWORD=sonar \
    -e SONARQUBE_JDBC_URL=jdbc:postgresql://localhost/sonar \
    sonarqube:5.1

More recipes can be found [here](https://github.com/SonarSource/docker-sonarqube/blob/master/recipes.md)

## Administration

The administration guide can be found [here](http://docs.sonarqube.org/display/SONAR/Administration+Guide).

# Supported Docker versions

This image is officially supported on Docker version 1.6.0.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us
through a [GitHub issue](https://github.com/SonarSource/docker-sonarqube/issues).

