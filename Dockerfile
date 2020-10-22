FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY /var/lib/jenkins/workspace/project1/target/web-application.war /usr/local/tomcat/webapps/web-application.war
