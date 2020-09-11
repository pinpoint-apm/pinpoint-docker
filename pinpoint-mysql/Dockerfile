FROM mysql:5.7

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.1.0}

RUN apt update \ 
	&& apt-get install -y --no-install-recommends ca-certificates wget \
	&& wget -O /docker-entrypoint-initdb.d/CreateTableStatement-mysql.sql "https://raw.githubusercontent.com/naver/pinpoint/v$PINPOINT_VERSION/web/src/main/resources/sql/CreateTableStatement-mysql.sql" \
	&& wget -O /docker-entrypoint-initdb.d/SpringBatchJobRepositorySchema-mysql.sql "https://raw.githubusercontent.com/naver/pinpoint/v$PINPOINT_VERSION/web/src/main/resources/sql/SpringBatchJobRepositorySchema-mysql.sql" \
	&& sed -i '/^--/d' /docker-entrypoint-initdb.d/CreateTableStatement-mysql.sql \
	&& sed -i '/^--/d' /docker-entrypoint-initdb.d/SpringBatchJobRepositorySchema-mysql.sql \
	&& apt-get purge -y --auto-remove ca-certificates wget
