FROM tomcat:9.0-jdk11
COPY target/UsuariosCRUD-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/

