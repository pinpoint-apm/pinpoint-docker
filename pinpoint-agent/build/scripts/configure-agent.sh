#!/bin/bash
set -e
set -x

sed -i "/profiler.transport.grpc.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.transport.grpc.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" /pinpoint-agent/profiles/${SPRING_PROFILES}/pinpoint-env.config
sed -i "/profiler.transport.grpc.agent.collector.port=/ s/=.*/=${PROFILER_TRANSPORT_AGENT_COLLECTOR_PORT}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.transport.grpc.metadata.collector.port=/ s/=.*/=${PROFILER_TRANSPORT_METADATA_COLLECTOR_PORT}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.transport.grpc.stat.collector.port=/ s/=.*/=${PROFILER_TRANSPORT_STAT_COLLECTOR_PORT}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.transport.grpc.span.collector.port=/ s/=.*/=${PROFILER_TRANSPORT_SPAN_COLLECTOR_PORT}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.sampling.rate=/ s/=.*/=${PROFILER_SAMPLING_RATE}/" /pinpoint-agent/profiles/${SPRING_PROFILES}/pinpoint-env.config

sed -i "/level value=/ s/=.*/=\"${DEBUG_LEVEL}\"\/>/g" /pinpoint-agent/profiles/${SPRING_PROFILES}/log4j.xml

#ln -s  /pinpoint-agent /pinpoint-agent

exec "$@"
