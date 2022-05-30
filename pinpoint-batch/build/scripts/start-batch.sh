#!/bin/bash
set -e
set -x

exec java -jar /pinpoint/pinpoint-batch.jar --spring.config.additional-location=/pinpoint/config/pinpoint-batch.properties