FROM openjdk:11.0.16-jre-slim-buster

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.5.2}
ARG INSTALL_URL=https://github.com/pinpoint-apm/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-web-boot-${PINPOINT_VERSION}.jar

RUN mkdir -p /pinpoint/config \
    && mkdir -p /pinpoint/scripts

COPY /build/config/pinpoint-web.properties /pinpoint/config/
COPY /build/scripts/start-web.sh /pinpoint/scripts/

RUN apt-get update && apt-get install --no-install-recommends -y curl && apt-get clean \
    && chmod a+x /pinpoint/scripts/start-web.sh \
    && chmod a+x /pinpoint/config/pinpoint-web.properties \
    && curl -SL ${INSTALL_URL} -o /pinpoint/pinpoint-web-boot.jar

#entry point to start-web.sh for future use.
ENTRYPOINT ["sh", "/pinpoint/scripts/start-web.sh"]
