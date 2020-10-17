FROM jboss/wildfly:9.0.2.Final

# Set the WILDFLY_VERSION env variable
#ENV WILDFLY_VERSION 9.0.1.Final
ENV JBOSS_HOME /opt/jboss/wildfly
ENV JAVA_OPTS=" -Xms784m -Xmx784m -XX:MetaspaceSize=784m -XX:MaxMetaspaceSize=784m -Djava.net.preferIPv4Stack=true -Duser.timezone=America/Sao_Paulo -Duser.language=pt -Duser.country=BR"

ENV DATASOURCE_NAME ApplicationDS
ENV DATASOURCE_JNDI ApplicationDS

ENV DB_HOST postgres
ENV DB_PORT 5432
ENV DB_USER docker
ENV DB_PASS docker
ENV DB_NAME my_db

COPY start-wildfly.sh $JBOSS_HOME/bin
COPY postgresql-42.2.8.jar /tmp


USER root
RUN chown -R jboss:0 ${JBOSS_HOME} \
    && chmod -R g+rw ${JBOSS_HOME} \
    && chmod 755 $JBOSS_HOME/bin/start-wildfly.sh \
    && chown jboss:jboss $JBOSS_HOME/bin/start-wildfly.sh
USER jboss

ENTRYPOINT $JBOSS_HOME/bin/start-wildfly.sh