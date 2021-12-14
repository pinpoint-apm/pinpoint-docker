FROM java:8

ARG PINPOINT_VERSION
ARG AGENT_ID
ARG APP_NAME
ENV JAVA_OPTS="-javaagent:/pinpoint-agent/pinpoint-bootstrap-${PINPOINT_VERSION}.jar -Dpinpoint.agentId=${AGENT_ID} -Dpinpoint.applicationName=${APP_NAME} -Dspring.profiles.active=${SPRING_PROFILES}"

RUN mkdir -p javasample
COPY build/Sample.java javasample
WORKDIR javasample

RUN javac Sample.java
CMD java ${JAVA_OPTS} Sample
