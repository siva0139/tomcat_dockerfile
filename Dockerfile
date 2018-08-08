FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.90/bin/apache-tomcat-7.0.90.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar -xvzf tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-7.0.90/* /usr/local/tomcat/
EXPOSE 8080
ADD http://ftp-chi.osuosl.org/pub/jenkins/war-stable/2.121.2/jenkins.war /var/lib/tomcat7/webapps/jenkins.war
CMD /usr/local/tomcat/bin/catalina.sh run
