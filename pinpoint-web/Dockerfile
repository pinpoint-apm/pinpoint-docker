FROM tomcat:8-jre8

LABEL maintainer="Roy Kim <roy.kim@navercorp.com>"

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-1.8.0}
ARG INSTALL_URL=https://github.com/naver/pinpoint/releases/download/${PINPOINT_VERSION}/pinpoint-web-${PINPOINT_VERSION}.war

COPY /build/scripts/start-web.sh /usr/local/bin/
COPY /build/mail.zip /assets/mail.zip

RUN chmod a+x /usr/local/bin/start-web.sh \
    && curl -SL ${INSTALL_URL} -o pinpoint-web.war \
    && rm -rf /usr/local/tomcat/webapps \
    && mkdir -p /usr/local/tomcat/webapps \
    && unzip pinpoint-web.war -d /usr/local/tomcat/webapps/ROOT \
    && rm -rf pinpoint-web.war

ENTRYPOINT ["/usr/local/bin/start-web.sh"]
