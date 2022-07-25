FROM tomcat:8-jre8

COPY /build/pinpoint-quickstart-testapp.war quickstart.war

RUN rm -rf /usr/local/tomcat/webapps \
    && mkdir -p /usr/local/tomcat/webapps \
    && apt-get update \
    && apt-get install --no-install-recommends -y unzip\
    && unzip quickstart.war -d /usr/local/tomcat/webapps/ROOT \
    && rm -rf quickstart.war

CMD [ "catalina.sh", "run" ]
