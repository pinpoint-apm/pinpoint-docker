#!/bin/bash
set -e
set -x

sed -i "/cluster.enable=/ s/=.*/=${CLUSTER_ENABLE}/" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-web.properties
sed -i "/cluster.zookeeper.address=/ s/=.*/=${CLUSTER_ZOOKEEPER_ADDRESS}/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-web.properties
#sed -i "/cluster.web.tcp.port=/ s/=.*/=${CLUSTER_WEB_TCP_PORT}/" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-web.properties
sed -i "/admin.password=/ s/=.*/=${ADMIN_PASSWORD}/" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-web.properties
sed -i "/config.sendUsage=/ s/=.*/=${ANALYTICS}/" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-web.properties
sed -i "/config.show.applicationStat=/ s/=.*/=${CONFIG_SHOW_APPLICATIONSTAT}/" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-web.properties

sed -i "/hbase.client.host=/ s/=.*/=${HBASE_HOST}/" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/hbase.properties
sed -i "/hbase.client.port=/ s/=.*/=${HBASE_PORT}/" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/hbase.properties

sed -i "/batch.enable=/ s/=.*/=${BATCH_ENABLE}/" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/batch.properties
sed -i "/batch.server.ip=/ s/=.*/=${BATCH_SERVER_IP}/" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/batch.properties
sed -i "/batch.flink.server=/ s/=.*/=${BATCH_FLINK_SERVER}/" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/batch.properties

sed -i "/level value=/ s/=.*/=\"${DEBUG_LEVEL}\"\/>/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/log4j.xml


exec /usr/local/tomcat/bin/catalina.sh run
