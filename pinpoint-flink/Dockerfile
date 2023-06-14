FROM flink:1.14-java11
ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.5.2}
ARG INSTALL_URL=https://github.com/pinpoint-apm/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-flink-job-${PINPOINT_VERSION}.jar

RUN apt-get update \
 && apt-get install --no-install-recommends -y zip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /build \
 && curl -SL ${INSTALL_URL} -o /build/pinpoint-flink-job.jar

COPY build/ /build/
COPY docker-bin/ /docker-bin/
ENTRYPOINT ["/docker-bin/docker-entrypoint.sh"]

