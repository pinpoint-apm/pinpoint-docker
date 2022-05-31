FROM adoptopenjdk/openjdk11:jdk-11.0.14.1_1-alpine-slim

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.4.0}
ARG INSTALL_URL=https://github.com/pinpoint-apm/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-web-boot-${PINPOINT_VERSION}.jar

RUN mkdir -p /pinpoint/config \
    && mkdir -p /pinpoint/scripts

COPY /build/config/pinpoint-web.properties /pinpoint/config/
COPY /build/scripts/start-web.sh /pinpoint/scripts/
#temporary line for local test
#COPY /pinpoint-web-boot-2.4.0-SNAPSHOT.jar /pinpoint/pinpoint-web-boot.jar

RUN apk --no-cache add curl \
    && chmod a+x /pinpoint/scripts/start-web.sh \
    && chmod a+x /pinpoint/config/pinpoint-web.properties \
    && curl -SL ${INSTALL_URL} -o /pinpoint/pinpoint-web-boot.jar

#entry point to start-web.sh for future use.
ENTRYPOINT ["sh", "/pinpoint/scripts/start-web.sh"]
