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

WEB_INF_CLASSES_DIR=/usr/local/tomcat/webapps/ROOT/WEB-INF/classes
APPLICATION_CONTEXT_WEB_FILE=${WEB_INF_CLASSES_DIR}/applicationContext-web.xml
APPLICATION_CONTEXT_MAIL_FILE=${WEB_INF_CLASSES_DIR}/applicationContext-mail.xml

echo -e "
jdbc.driverClassName=${JDBC_DRIVER:-com.mysql.jdbc.Driver}
jdbc.url=${JDBC_URL:-jdbc:mysql://localhost:13306/pinpoint?characterEncoding=UTF-8}
jdbc.username=${JDBC_USERNAME:-admin}
jdbc.password=${JDBC_PASSWORD:-admin}
" > ${WEB_INF_CLASSES_DIR}/jdbc.properties

sed -i '/classpath:applicationContext-mail.xml/d' ${APPLICATION_CONTEXT_WEB_FILE}
if [ "$MAIL_HOST" != "" ]; then
    sed -i 's/<\/beans>/    <import resource="classpath:applicationContext-mail.xml" \/>\
<\/beans>/' ${APPLICATION_CONTEXT_WEB_FILE}
	
	sed -i "/name=\"host\"/c\                <property name=\"host\" value=\"${MAIL_HOST}\" />" ${APPLICATION_CONTEXT_MAIL_FILE}
	sed -i "/name=\"port\"/c\                <property name=\"port\" value=\"${MAIL_PORT}\" />" ${APPLICATION_CONTEXT_MAIL_FILE}
	sed -i "/name=\"username\"/c\                <property name=\"username\" value=\"${MAIL_USERNAME}\" />" ${APPLICATION_CONTEXT_MAIL_FILE}
	sed -i "/name=\"password\"/c\                <property name=\"password\" value=\"${MAIL_PASSWORD}\" />" ${APPLICATION_CONTEXT_MAIL_FILE}
	
	if [ "$MAIL_PROPERTIES_MAIL_TRANSPORT_PROTOCOL" != "" ]; then
		sed -i "/prop key=\"mail.transport.protocol\"/c\                                <prop key=\"mail.transport.protocol\">${MAIL_PROPERTIES_MAIL_TRANSPORT_PROTOCOL}</prop>" ${APPLICATION_CONTEXT_MAIL_FILE}
	else
		sed -i "/prop key=\"mail.transport.protocol\"/c\                                <!-- <prop key=\"mail.transport.protocol\">smtp</prop> -->" ${APPLICATION_CONTEXT_MAIL_FILE}
	fi
	
	if [ "$MAIL_PROPERTIES_MAIL_SMTP_PORT" != "" ]; then
		sed -i "/prop key=\"mail.smtp.port\"/c\                                <prop key=\"mail.smtp.port\">${MAIL_PROPERTIES_MAIL_SMTP_PORT}</prop>" ${APPLICATION_CONTEXT_MAIL_FILE}
	else
		sed -i "/prop key=\"mail.smtp.port\"/c\                                <!-- <prop key=\"mail.smtp.port\">25</prop> -->" ${APPLICATION_CONTEXT_MAIL_FILE}
	fi
	
	if [ "$MAIL_PROPERTIES_MAIL_SMTP_AUTH" != "" ]; then
		sed -i "/prop key=\"mail.smtp.auth\"/c\                                <prop key=\"mail.smtp.auth\">${MAIL_PROPERTIES_MAIL_SMTP_AUTH}</prop>" ${APPLICATION_CONTEXT_MAIL_FILE}
	else
		sed -i "/prop key=\"mail.smtp.auth\"/c\                                <!-- <prop key=\"mail.smtp.auth\">true</prop> -->" ${APPLICATION_CONTEXT_MAIL_FILE}
	fi
	
	if [ "$MAIL_PROPERTIES_MAIL_STARTTLS_ENABLE" != "" ]; then
		sed -i "/prop key=\"mail.smtp.starttls.enable\"/c\                                <prop key=\"mail.smtp.starttls.enable\">${MAIL_PROPERTIES_MAIL_STARTTLS_ENABLE}</prop>" ${APPLICATION_CONTEXT_MAIL_FILE}
	else
		sed -i "/prop key=\"mail.smtp.starttls.enable\"/c\                                <!-- <prop key=\"mail.smtp.starttls.enable\">true</prop> -->" ${APPLICATION_CONTEXT_MAIL_FILE}
	fi
	
	if [ "$MAIL_PROPERTIES_MAIL_STARTTLS_REQUIRED" != "" ]; then
		sed -i "/prop key=\"mail.smtp.starttls.required\"/c\                                <prop key=\"mail.smtp.starttls.required\">${MAIL_PROPERTIES_MAIL_STARTTLS_REQUIRED}</prop>" ${APPLICATION_CONTEXT_MAIL_FILE}
	else
		sed -i "/prop key=\"mail.smtp.starttls.required\"/c\                                <!-- <prop key=\"mail.smtp.starttls.required\">true</prop> -->" ${APPLICATION_CONTEXT_MAIL_FILE}
	fi
	
	if [ "$MAIL_PROPERTIES_MAIL_DEBUG" != "" ]; then
		sed -i "/prop key=\"mail.debug\"/c\                                <prop key=\"mail.debug\">${MAIL_PROPERTIES_MAIL_DEBUG}</prop>" ${APPLICATION_CONTEXT_MAIL_FILE}
	else
		sed -i "/prop key=\"mail.debug\"/c\                                <!-- <prop key=\"mail.debug\">true</prop> -->" ${APPLICATION_CONTEXT_MAIL_FILE}
	fi
	
	if [ "$MAIL_PROPERTIES_MAIL_SMTP_FROM" != "" ]; then
		sed -i "/prop key=\"mail.smtp.from\"/c\                                <prop key=\"mail.smtp.from\">${MAIL_PROPERTIES_MAIL_SMTP_FROM}</prop>" ${APPLICATION_CONTEXT_MAIL_FILE}
	else
		sed -i "/prop key=\"mail.smtp.from\"/c\                                <!-- <prop key=\"mail.smtp.from\">abc@example.com</prop> -->" ${APPLICATION_CONTEXT_MAIL_FILE}
	fi
fi

exec /usr/local/tomcat/bin/catalina.sh run
