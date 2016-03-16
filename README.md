# tomcat-docker
Docker container with Oracle Java 8 and Apache Tomcat 8 server installed on it
## how to use
This container is at the base of a Tomcat server so put all .war files in the webapp/ folder.  
The tomcat users has been overrided so there is a default manager user which has the username admin and password admin meaning you can log into the Manager App with those credientials.  
A typical run of this container would be:  
> docker run -p 8080:8080 carlov20/oracle-tomcat