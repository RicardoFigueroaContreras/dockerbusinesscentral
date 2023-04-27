# TO Build docker Images use this command

docker build -t business-central-image .

# To run a container user this command

docker run -d -p 9990:9990 -p 8080:8080 --name jboss_kie_apps business-central-image

# To see the logs
tail -f /opt/jboss/wildfly/standalone/log/server.log
