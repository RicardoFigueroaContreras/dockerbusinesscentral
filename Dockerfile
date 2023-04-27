# FROM quay.io/wildfly/wildfly:27.0.1.Final-jdk11
FROM quay.io/wildfly/wildfly:23.0.2.Final
ENV JAVA_OPTS -Xms256m -Xmx2048m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=512m -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8
RUN /opt/jboss/wildfly/bin/add-user.sh -a -u kieserver -p kieserver1! -g kie-server
RUN /opt/jboss/wildfly/bin/add-user.sh -a -u admin -p admin -g admin,kie-server,rest-all
ADD business-central.war /opt/jboss/wildfly/standalone/deployments/
ADD kie-server-controller.war /opt/jboss/wildfly/standalone/deployments/
ADD kie-server-router-proxy-7.73.0.Final.jar /opt/jboss/wildfly/standalone/deployments/
ADD kie-server.war /opt/jboss/wildfly/standalone/deployments/
ADD standalone-full.xml /opt/jboss/wildfly/standalone/configuration/

EXPOSE 8001
EXPOSE 8080

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-c", "standalone-full.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
