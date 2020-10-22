FROM tomcat:8
# Take the war and copy to tomcat webapps location

COPY ./web-application.war /usr/local/tomcat/webapps
