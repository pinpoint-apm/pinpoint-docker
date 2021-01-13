FROM flink:1.3
ARG PINPOINT_VERSION=2.2.0
# hadolint ignore=DL3008
RUN apt-get update \
 && apt-get install --no-install-recommends -y zip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
ADD https://github.com/pinpoint-apm/pinpoint/releases/download/v${PINPOINT_VERSION}/pinpoint-flink-job-${PINPOINT_VERSION}.jar /build/
COPY build/ /build/
COPY docker-bin/ /docker-bin/
ENTRYPOINT ["/docker-bin/docker-entrypoint.sh"]