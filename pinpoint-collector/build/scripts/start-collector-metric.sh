#!/bin/bash
set -e
set -x

exec java -jar /pinpoint/pinpoint-collector-boot.jar --spring.config.additional-location=/pinpoint/config/pinpoint-collector.properties --pinpoint.collector.type=ALL