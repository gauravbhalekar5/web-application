FROM tomcat:8
# Take the war and copy to tomcat webapps location

COPY target/*.war /usr/local/tomcat/webapps/*.war
