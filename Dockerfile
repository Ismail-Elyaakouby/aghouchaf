# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "valaxytech@gmail.com" 
COPY ./target/hello-world-war-1.0.6.war /usr/local/tomcat/webapps
