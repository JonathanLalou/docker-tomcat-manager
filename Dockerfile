FROM tomcat:9.0.2-jre8-alpine
LABEL maintainer="sayasoft.fr"

# Work folder in the container (not the host)
WORKDIR /usr/local/tomcat/

RUN apk add --no-cache \
    bash               \
    bc                 \
    coreutils          \
    gawk               \
    curl               \
    grep               \
    sed

ENV mysql-version=5.1.45

# clean Tomcat folders
#RUN rm -rf webapps/*
RUN rm -rf webapps/ROOT
RUN rm -rf webapps/docs
RUN rm -rf webapps/examples

#RUN rm -rf /conf/context.xml
RUN rm -rf /conf/tomcat-users.xml
# copy the context.xml
#COPY etc/docker/tomcat/context.xml conf/
COPY ./tomcat-users.xml conf/
COPY ./context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY ./context.xml /usr/local/tomcat/webapps/host-manager/META-INF/

# Install MySQL driver
#RUN curl -L \
#    'http://central.maven.org/maven2/mysql/mysql-connector-java/${mysql-version}/mysql-connector-java-${mysql-version}.jar' \
#    -o /usr/local/tomcat/lib/mysql-connector-java-${mysql-version}.jar


#COPY ./manager.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
