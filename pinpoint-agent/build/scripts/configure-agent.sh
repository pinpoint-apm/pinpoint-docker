#!/bin/bash
set -e
set -x

sed -i "/profiler.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.collector.tcp.port=/ s/=.*/=${COLLECTOR_TCP_PORT}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.collector.stat.port=/ s/=.*/=${COLLECTOR_STAT_PORT}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.collector.span.port=/ s/=.*/=${COLLECTOR_SPAN_PORT}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.sampling.rate=/ s/=.*/=${PROFILER_SAMPLING_RATE}/" /pinpoint-agent/pinpoint.config

sed -i "/level value=/ s/=.*/=\"${DEBUG_LEVEL}\"\/>/g" /pinpoint-agent/lib/log4j.xml

#ln -s  /pinpoint-agent /pinpoint-agent

exec "$@"
