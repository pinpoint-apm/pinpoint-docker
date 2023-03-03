FROM mysql:8.0

ARG PINPOINT_VERSION=${PINPOINT_VERSION:-2.5.1}

RUN curl -SL "https://raw.githubusercontent.com/pinpoint-apm/pinpoint/v$PINPOINT_VERSION/web/src/main/resources/sql/CreateTableStatement-mysql.sql" -o /docker-entrypoint-initdb.d/CreateTableStatement-mysql.sql \
	&& curl -SL "https://raw.githubusercontent.com/pinpoint-apm/pinpoint/v$PINPOINT_VERSION/web/src/main/resources/sql/SpringBatchJobRepositorySchema-mysql.sql" -o /docker-entrypoint-initdb.d/SpringBatchJobRepositorySchema-mysql.sql \
	&& sed -i '/^--/d' /docker-entrypoint-initdb.d/CreateTableStatement-mysql.sql \
	&& sed -i '/^--/d' /docker-entrypoint-initdb.d/SpringBatchJobRepositorySchema-mysql.sql