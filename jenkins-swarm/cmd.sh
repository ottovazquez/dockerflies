#!/bin/sh

JAR=`ls -1 ${JENKINS_HOME}/swarm-client-*.jar | tail -n 1`

SWARM_OPTS="-fsroot ${JENKINS_HOME}"

if [ ! -z "$JENKINS_USERNAME" ]; then
  SWARM_OPTS="${SWARM_OPTS} -username $JENKINS_USERNAME"
fi
if [ ! -z "$JENKINS_PASSWORD" ]; then
  SWARM_OPTS="${SWARM_OPTS} -password $JENKINS_PASSWORD"
fi
if [ ! -z "$JENKINS_SLAVE_EXECUTORS" ]; then
  SWARM_OPTS="${SWARM_OPTS} -executors $SLAVE_EXECUTORS"
fi
if [ ! -z "$JENKINS_SLAVE_LABELS" ]; then
  SWARM_OPTS="${SWARM_OPTS} -labels $SLAVE_LABELS"
fi
if [ ! -z "$JENKINS_SLAVE_NAME" ]; then
  SWARM_OPTS="${SWARM_OPTS} -name $SLAVE_NAME"
fi
if [ ! -z "$JENKINS_MASTER" ]; then
  SWARM_OPTS="${SWARM_OPTS} -master $JENKINS_MASTER"
else
  if [ ! -z "$JENKINS_SERVICE_PORT" ]; then
    # kubernetes environment variable
    SWARM_OPTS="${SWARM_OPTS} -master http://$SERVICE_HOST:$JENKINS_SERVICE_PORT"
  fi
fi

java -jar ${JAR} ${SWARM_OPTS} ${JENKINS_SWARM_EXTRA}
