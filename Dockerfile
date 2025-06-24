FROM tomcat:9.0-jdk11
COPY target/ROOT.war /usr/local/tomcat/webapps/

