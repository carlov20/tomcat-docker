FROM ubuntu:14.04

MAINTAINER carlov20

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y software-properties-common
RUN apt-get install -y debconf-utils
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get upgrade -y
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y oracle-java8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.32/bin/apache-tomcat-8.0.32.tar.gz
RUN tar xvzf apache-tomcat-8.0.32.tar.gz
RUN mv apache-tomcat-8.0.32 /opt
ENV CATALINA_HOME /opt/apache-tomcat-8.0.32
RUN rm apache-tomcat-8.0.32.tar.gz
EXPOSE 8080
WORKDIR /opt/apache-tomcat-8.0.32/
COPY tomcat-users.xml conf/
CMD ["bin/catalina.sh","run"]