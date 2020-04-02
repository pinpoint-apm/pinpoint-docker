#!/bin/bash
set -e
set -x

WEB_INF_CLASSES_DIR=/usr/local/tomcat/webapps/ROOT/WEB-INF/classes
APPLICATION_WEB_PROPERTIES=${WEB_INF_CLASSES_DIR}/pinpoint-web.properties
APPLICATION_HBASE_PROPERTIES=${WEB_INF_CLASSES_DIR}/profiles/${SPRING_PROFILES}/hbase-env.properties
APPLICATION_BATCH_PROPERTIES=${WEB_INF_CLASSES_DIR}/batch.properties
APPLICATION_JDBC_PROPERTIES=${WEB_INF_CLASSES_DIR}/jdbc.properties

sed -i "/cluster.enable=/ s/=.*/=${CLUSTER_ENABLE}/" ${APPLICATION_WEB_PROPERTIES}
#sed -i "/cluster.zookeeper.address=/ s/=.*/=${CLUSTER_ZOOKEEPER_ADDRESS}/g" ${APPLICATION_WEB_PROPERTIES}
#sed -i "/cluster.web.tcp.port=/ s/=.*/=${CLUSTER_WEB_TCP_PORT}/" ${APPLICATION_WEB_PROPERTIES}
sed -i "/admin.password=/ s/=.*/=${ADMIN_PASSWORD}/" ${APPLICATION_WEB_PROPERTIES}
sed -i "/config.sendUsage=/ s/=.*/=${ANALYTICS}/" ${APPLICATION_WEB_PROPERTIES}
sed -i "/config.show.applicationStat=/ s/=.*/=${CONFIG_SHOW_APPLICATIONSTAT}/" ${APPLICATION_WEB_PROPERTIES}

sed -i "/hbase.client.host=/ s/=.*/=${HBASE_HOST}/" ${APPLICATION_HBASE_PROPERTIES}
sed -i "/hbase.client.port=/ s/=.*/=${HBASE_PORT}/" ${APPLICATION_HBASE_PROPERTIES}

sed -i "/batch.enable=/ s/=.*/=${BATCH_ENABLE}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/batch.server.ip=/ s/=.*/=${BATCH_SERVER_IP}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/batch.flink.server=/ s/=.*/=${BATCH_FLINK_SERVER}/" ${APPLICATION_BATCH_PROPERTIES}

sed -i "/level value=/ s/=.*/=\"${DEBUG_LEVEL}\"\/>/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/profiles/${SPRING_PROFILES}/log4j.xml
sed -i "/jdbc.driverClassName=/ s/=.*/=${JDBC_DRIVER:-com.mysql.jdbc.Driver}/" ${APPLICATION_JDBC_PROPERTIES}
sed -i "/jdbc.url=/ s/=.*/=${JDBC_URL//\//\\/}/" ${APPLICATION_JDBC_PROPERTIES}
sed -i "/jdbc.username=/ s/=.*/=${JDBC_USERNAME:-admin}/" ${APPLICATION_JDBC_PROPERTIES}
sed -i "/jdbc.password=/ s/=.*/=${JDBC_PASSWORD:-admin}/" ${APPLICATION_JDBC_PROPERTIES}

sed -i "/alarm.mail.server.url=/ s/=.*/=${MAIL_SERVER_URL}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/alarm.mail.server.port=/ s/=.*/=${MAIL_SERVER_PORT:-587}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/alarm.mail.server.username=/ s/=.*/=${MAIL_SERVER_USERNAME}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/alarm.mail.server.password=/ s/=.*/=${MAIL_SERVER_PASSWORD}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/alarm.mail.sender.address=/ s/=.*/=${MAIL_SENDER_ADDRESS:-pinpoint_operator@pinpoint.com}/" ${APPLICATION_BATCH_PROPERTIES}

sed -i "/alarm.mail.transport.protocol=/ s/=.*/=${MAIL_TRANSPORT_PROTOCOL:-smtp}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/alarm.mail.smtp.port=/ s/=.*/=${MAIL_SMTP_PORT:-587}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/alarm.mail.smtp.auth=/ s/=.*/=${MAIL_SMTP_AUTH:-false}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/alarm.mail.smtp.starttls.enable=/ s/=.*/=${MAIL_SMTP_STARTTLS_ENABLE:-false}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/alarm.mail.smtp.starttls.required=/ s/=.*/=${MAIL_SMTP_STARTTLS_REQUIRED:-false}/" ${APPLICATION_BATCH_PROPERTIES}
sed -i "/alarm.mail.debug=/ s/=.*/=${MAIL_DEBUG:-false}/" ${APPLICATION_BATCH_PROPERTIES}

exec /usr/local/tomcat/bin/catalina.sh run
