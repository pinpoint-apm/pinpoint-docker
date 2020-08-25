#!/bin/bash
set -e
set -x

exec java -jar /pinpoint/pinpoint-web-boot.jar --spring.config.additional-location=/pinpoint/config/pinpoint-web.properties