FROM openjdk:8-jdk-alpine

LABEL maintainer="Roy Kim <roy.kim@navercorp.com>"

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.1.0}
ARG INSTALL_URL=https://github.com/naver/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-collector-boot-${PINPOINT_VERSION}.jar

RUN mkdir -p /pinpoint/config \
    && mkdir -p /pinpoint/scripts

COPY /build/config/pinpoint-collector.properties /pinpoint/config/
COPY /build/scripts/start-collector.sh /pinpoint/scripts/
#temporary line for local test
#COPY /pinpoint-collector-boot-2.1.0-SNAPSHOT.jar /pinpoint/pinpoint-collector-boot.jar

RUN apk --no-cache add curl \
    && chmod a+x /pinpoint/scripts/start-collector.sh \
    && chmod a+x /pinpoint/config/pinpoint-collector.properties \
    && curl -SL ${INSTALL_URL} -o /pinpoint/pinpoint-collector-boot.jar

ENTRYPOINT ["sh", "/pinpoint/scripts/start-collector.sh"]

