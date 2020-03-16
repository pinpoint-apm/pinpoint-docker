FROM tomcat:8-jre8

LABEL maintainer="Roy Kim <roy.kim@navercorp.com>"

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.0.1}

ARG INSTALL_URL=https://github.com/naver/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-collector-${PINPOINT_VERSION}.war

COPY /build/scripts/start-collector.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/start-collector.sh
RUN curl -SL ${INSTALL_URL} -o pinpoint-collector.war
RUN rm -rf /usr/local/tomcat/webapps
RUN mkdir -p /usr/local/tomcat/webapps
RUN unzip pinpoint-collector.war -d /usr/local/tomcat/webapps/ROOT
RUN rm -rf pinpoint-collector.war
RUN sed -i "s/8005/9005/g" /usr/local/tomcat/conf/server.xml \
    && sed -i "s/8080/9080/g" /usr/local/tomcat/conf/server.xml \
    && sed -i "s/8009/9009/g" /usr/local/tomcat/conf/server.xml \
    && sed -i "s/8443/9443/g" /usr/local/tomcat/conf/server.xml

ENTRYPOINT ["/usr/local/bin/start-collector.sh"]

