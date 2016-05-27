FROM ubuntu:14.04
MAINTAINER "xjpdocker<jsxiejp@163.com>"
ENV REFRESHED_AT 2016-5-20

RUN apt-get update
RUN apt-get install -y tomcat7 default-jdk

ENV CATALINA_HOME /usr/share/tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
ENV CATALINA_PID  /var/run/tomcat7.pid
ENV CATALINA_SH   /usr/share/tomcat7/bin/catalina.sh
ENV CATALINA_TMPDIR /tmp/tomcat7-tomcat7-tmp

RUN mkdir -p $CATALINA_TMPDIR

ADD libsigar-amd64-linux.so /usr/lib
ADD WebCpuInfo.war /var/lib/tomcat7/webapps

VOLUME ["/var/lib/tomcat7/webapps/"]
ENTRYPOINT /usr/share/tomcat7/bin/startup.sh

EXPOSE 8080 9000