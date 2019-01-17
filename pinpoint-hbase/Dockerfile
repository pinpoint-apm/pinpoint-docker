FROM java:8-jdk

LABEL maintainer="Roy Kim <roy.kim@navercorp.com>"

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-1.8.1}

ENV HBASE_REPOSITORY=http://apache.mirrors.pair.com/hbase
ENV HBASE_SUB_REPOSITORY=http://archive.apache.org/dist/hbase

ENV HBASE_VERSION=1.2.6
ENV BASE_DIR=/opt/hbase
ENV HBASE_HOME=${BASE_DIR}/hbase-${HBASE_VERSION}


COPY hbase-site.xml hbase-site.xml

RUN mkdir -p ${BASE_DIR} \
    && cd ${BASE_DIR} \
    && curl -fSL "${HBASE_REPOSITORY}/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz" -o hbase.tar.gz || curl -fSL "${HBASE_SUB_REPOSITORY}/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz" -o hbase.tar.gz \
    && tar xfvz hbase.tar.gz \
    && mv ../../hbase-site.xml ../../${HBASE_HOME}/conf/hbase-site.xml \
    && curl -SL "https://raw.githubusercontent.com/naver/pinpoint/${PINPOINT_VERSION}/hbase/scripts/hbase-create.hbase" -o ${BASE_DIR}/hbase-create.hbase \
    && ${HBASE_HOME}/bin/start-hbase.sh \
    && sleep 10 \
    && ${HBASE_HOME}/bin/hbase shell ${BASE_DIR}/hbase-create.hbase \
    && ${HBASE_HOME}/bin/stop-hbase.sh \
    && rm ${BASE_DIR}/hbase-create.hbase \
    && rm -rf hbase.tar.gz

VOLUME ["/home/pinpoint/hbase", "/home/pinpoint/zookeeper"]

ENTRYPOINT ${BASE_DIR}/hbase-${HBASE_VERSION}/bin/hbase master start
