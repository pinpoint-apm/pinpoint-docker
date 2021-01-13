#!/bin/bash

# In flink version < 1.11 we can't use "job cluster" because it's not yet available
if [ "$1" = "standalone-job" ]; then
  cd /build
  sed -i -e "s/#PINPOINT_ZOOKEEPER_ADDRESS#/${PINPOINT_ZOOKEEPER_ADDRESS}/g" profiles/release/*
  zip -r pinpoint-flink-job-*.jar profiles/
  cd -

  mv /build/pinpoint-flink-job-*.jar pinpoint-flink-job.jar

  shift

  /docker-entrypoint.sh jobmanager &
  sleep 5
  exec flink run $@
else
  exec /docker-entrypoint.sh $@
fi