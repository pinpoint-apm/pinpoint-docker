FROM openjdk:8u342-slim

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.5.1}

ENV HBASE_REPOSITORY=http://apache.mirrors.pair.com/hbase
ENV HBASE_SUB_REPOSITORY=http://archive.apache.org/dist/hbase

ENV HBASE_VERSION=1.2.6
ENV BASE_DIR=/opt/hbase
ENV HBASE_HOME=${BASE_DIR}/hbase-${HBASE_VERSION}

COPY hbase-site.xml hbase-site.xml
COPY hbase-env.sh hbase-env.sh
COPY /build/scripts/initialize-hbase.sh /usr/local/bin/
COPY /build/scripts/check-table.sh /usr/local/bin/
COPY /build/scripts/configure-hbase.sh /usr/local/bin

RUN apt-get update && apt-get install --no-install-recommends -y curl && apt-get clean \
    && chmod a+x /usr/local/bin/initialize-hbase.sh \
    && chmod a+x /usr/local/bin/check-table.sh \
    && chmod a+x /usr/local/bin/configure-hbase.sh \
    && mkdir -p ${BASE_DIR} \
    && cd ${BASE_DIR} \
    && curl -fSL "${HBASE_REPOSITORY}/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz" -o hbase.tar.gz || curl -fSL "${HBASE_SUB_REPOSITORY}/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz" -o hbase.tar.gz \
    && tar xfvz hbase.tar.gz \
    && mv ../../hbase-site.xml ../../${HBASE_HOME}/conf/hbase-site.xml \
    && mv ../../hbase-env.sh ../../${HBASE_HOME}/conf/hbase-env.sh \
    && curl -SL "https://raw.githubusercontent.com/pinpoint-apm/pinpoint/v${PINPOINT_VERSION}/hbase/scripts/hbase-create.hbase" -o ${BASE_DIR}/hbase-create.hbase

VOLUME ["/home/pinpoint/hbase", "/home/pinpoint/zookeeper"]

CMD /usr/local/bin/initialize-hbase.sh && tail -f /dev/null

