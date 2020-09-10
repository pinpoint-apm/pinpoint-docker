#!/bin/bash
set -e
set -x

#sed -i "/profiler.transport.module=/ s/=.*/=${PROFILER_TRANSPORT_MODULE}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.transport.module=/ s/=.*/=${PROFILER_TRANSPORT_MODULE}/" /pinpoint-agent/profiles/${SPRING_PROFILES}/pinpoint.config

sed -i "/profiler.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" /pinpoint-agent/profiles/${SPRING_PROFILES}/pinpoint.config
sed -i "/profiler.collector.tcp.port=/ s/=.*/=${COLLECTOR_TCP_PORT}/" /pinpoint-agent/pinpoint-root.config
sed -i "/profiler.collector.stat.port=/ s/=.*/=${COLLECTOR_STAT_PORT}/" /pinpoint-agent/pinpoint-root.config
sed -i "/profiler.collector.span.port=/ s/=.*/=${COLLECTOR_SPAN_PORT}/" /pinpoint-agent/pinpoint-root.config

#sed -i "/profiler.transport.grpc.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" /pinpoint-agent/pinpoint.config
sed -i "/profiler.transport.grpc.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" /pinpoint-agent/profiles/${SPRING_PROFILES}/pinpoint.config
sed -i "/profiler.transport.grpc.agent.collector.port=/ s/=.*/=${PROFILER_TRANSPORT_AGENT_COLLECTOR_PORT}/" /pinpoint-agent/pinpoint-root.config
sed -i "/profiler.transport.grpc.metadata.collector.port=/ s/=.*/=${PROFILER_TRANSPORT_METADATA_COLLECTOR_PORT}/" /pinpoint-agent/pinpoint-root.config
sed -i "/profiler.transport.grpc.stat.collector.port=/ s/=.*/=${PROFILER_TRANSPORT_STAT_COLLECTOR_PORT}/" /pinpoint-agent/pinpoint-root.config
sed -i "/profiler.transport.grpc.span.collector.port=/ s/=.*/=${PROFILER_TRANSPORT_SPAN_COLLECTOR_PORT}/" /pinpoint-agent/pinpoint-root.config
sed -i "/profiler.sampling.rate=/ s/=.*/=${PROFILER_SAMPLING_RATE}/" /pinpoint-agent/profiles/${SPRING_PROFILES}/pinpoint.config

sed -i "/Root level=/ s/=.*/=\"${DEBUG_LEVEL}\"\/>/g" /pinpoint-agent/profiles/${SPRING_PROFILES}/log4j2.xml

exec "$@"
