#!/bin/sh

JAR=`ls -1 ${JENKINS_HOME}/swarm-client-*.jar | tail -n 1`

if [ -z "$JENKINS_MASTER_URL" ]; then
  echo "JENKINS_MASTER_URL is not set, exit now"
  exit 1
fi

JENKINS_SWARM_OPTS="-fsroot ${JENKINS_HOME} -master ${JENKINS_MASTER_URL}"

if [ -n "$JENKINS_USERNAME" ]; then
  JENKINS_SWARM_OPTS="${JENKINS_SWARM_OPTS} -username $JENKINS_USERNAME"
fi
if [ -n "$JENKINS_PASSWORD" ]; then
  JENKINS_SWARM_OPTS="${JENKINS_SWARM_OPTS} -password $JENKINS_PASSWORD"
fi
if [ -n "$JENKINS_SWARM_EXECUTORS" ]; then
  JENKINS_SWARM_OPTS="${JENKINS_SWARM_OPTS} -executors $JENKINS_SWARM_EXECUTORS"
fi

if [ "${JENKINS_SWARM_SSL_VERIFICATION}" == "false" ]; then
  JENKINS_SWARM_OPTS="${JENKINS_SWARM_OPTS} -disableSslVerification"
fi

java -jar ${JAR} ${JENKINS_SWARM_OPTS} ${JENKINS_SWARM_EXTRA}
