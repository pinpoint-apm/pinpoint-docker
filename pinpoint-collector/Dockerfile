FROM tomcat:8-jre8

LABEL maintainer="Roy Kim <roy.kim@navercorp.com>"

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-1.8.1}

ARG INSTALL_URL=https://github.com/naver/pinpoint/releases/download/${PINPOINT_VERSION}/pinpoint-collector-${PINPOINT_VERSION}.war

COPY /build/scripts/start-collector.sh /usr/local/bin/

RUN chmod a+x /usr/local/bin/start-collector.sh \
    && curl -SL ${INSTALL_URL} -o pinpoint-collector.war \
    && rm -rf /usr/local/tomcat/webapps \
    && mkdir -p /usr/local/tomcat/webapps \
    && unzip pinpoint-collector.war -d /usr/local/tomcat/webapps/ROOT \
    && rm -rf pinpoint-collector.war \
    && sed -i "s/8005/9005/g" /usr/local/tomcat/conf/server.xml \
    && sed -i "s/8080/9080/g" /usr/local/tomcat/conf/server.xml \
    && sed -i "s/8009/9009/g" /usr/local/tomcat/conf/server.xml \
    && sed -i "s/8443/9443/g" /usr/local/tomcat/conf/server.xml

ENTRYPOINT ["/usr/local/bin/start-collector.sh"]

