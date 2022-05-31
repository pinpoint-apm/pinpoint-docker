FROM adoptopenjdk/openjdk11:jdk-11.0.14.1_1-alpine-slim

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.4.0}
ARG INSTALL_URL=https://github.com/pinpoint-apm/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-batch-${PINPOINT_VERSION}.jar

RUN mkdir -p /pinpoint/config \
    && mkdir -p /pinpoint/scripts

COPY /build/config/pinpoint-batch.properties /pinpoint/config/
COPY /build/scripts/start-batch.sh /pinpoint/scripts/

RUN apk --no-cache add curl \
    && chmod a+x /pinpoint/scripts/start-batch.sh \
    && chmod a+x /pinpoint/config/pinpoint-batch.properties \
    && curl -SL ${INSTALL_URL} -o /pinpoint/pinpoint-batch.jar

ENTRYPOINT ["sh", "/pinpoint/scripts/start-batch.sh"]