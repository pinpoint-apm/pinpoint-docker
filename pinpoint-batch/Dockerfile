FROM openjdk:11.0.16-jre-slim-buster

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.5.2}
ARG INSTALL_URL=https://github.com/pinpoint-apm/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-batch-${PINPOINT_VERSION}.jar

RUN mkdir -p /pinpoint/config \
    && mkdir -p /pinpoint/scripts

COPY /build/config/pinpoint-batch.properties /pinpoint/config/
COPY /build/scripts/start-batch.sh /pinpoint/scripts/

RUN apt-get update && apt-get install --no-install-recommends -y curl && apt-get clean \
    && chmod a+x /pinpoint/scripts/start-batch.sh \
    && chmod a+x /pinpoint/config/pinpoint-batch.properties \
    && curl -SL ${INSTALL_URL} -o /pinpoint/pinpoint-batch.jar

ENTRYPOINT ["sh", "/pinpoint/scripts/start-batch.sh"]