FROM tomcat:8-jre8

LABEL maintainer="Roy Kim <roy.kim@navercorp.com>"

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-1.8.1}
ARG INSTALL_URL=https://github.com/naver/pinpoint/releases/download/${PINPOINT_VERSION}/pinpoint-web-${PINPOINT_VERSION}.war

COPY /build/scripts/start-web.sh /usr/local/bin/
COPY /build/mail.zip /assets/mail.zip

RUN chmod a+x /usr/local/bin/start-web.sh \
    && curl -SL ${INSTALL_URL} -o pinpoint-web.war \
    && rm -rf /usr/local/tomcat/webapps \
    && mkdir -p /usr/local/tomcat/webapps \
    && unzip pinpoint-web.war -d /usr/local/tomcat/webapps/ROOT \
    && rm -rf pinpoint-web.war \
    && curl -SL https://maven.java.net/content/repositories/releases/com/sun/mail/javax.mail/1.5.2/javax.mail-1.5.2.jar -o /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/javax.mail-1.5.2.jar \
    && unzip /assets/mail.zip -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/ \
    && rm -rf /assets/mail.zip

ENTRYPOINT ["/usr/local/bin/start-web.sh"]
