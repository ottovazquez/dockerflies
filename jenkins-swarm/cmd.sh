#!/bin/sh

JAR=`ls -1 ${JENKINS_SWARM_HOME}/swarm-client-*.jar | tail -n 1`

if [ -z "$JENKINS_SWARM_MASTER_URL" ]; then
  echo "JENKINS_MASTER_URL is not set, exit now"
  exit 1
fi

if [ -n "${JENKISN_SWARM_KNOWN_HOSTS}" ]; then
    SSH_DIR=$HOME/.ssh

    if [ ! -d ${SSH_DIR} ]; then
        mkdir ${SSH_DIR}
    fi
    if [ -f ${SSH_DIR}/known_hosts ]; then
        rm ${SSH_DIR}/known_hosts
    fi

    touch ${SSH_DIR}/known_hosts
    for i in $(echo ${JENKISN_SWARM_KNOWN_HOSTS} | tr ',' ' '); do
        ssh-keyscan -H $i >> ${SSH_DIR}/known_hosts
    done
    chmod 600 ${SSH_DIR}/known_hosts
fi

JENKINS_SWARM_OPTS="-fsroot ${JENKINS_SWARM_HOME} -master ${JENKINS_SWARM_MASTER_URL}"

if [ -n "$JENKINS_SWARM_USERNAME" ]; then
  JENKINS_SWARM_OPTS="${JENKINS_SWARM_OPTS} -username $JENKINS_SWARM_USERNAME"
fi
if [ -n "$JENKINS_SWARM_PASSWORD" ]; then
  JENKINS_SWARM_OPTS="${JENKINS_SWARM_OPTS} -password $JENKINS_SWARM_PASSWORD"
fi
if [ -n "$JENKINS_SWARM_EXECUTORS" ]; then
  JENKINS_SWARM_OPTS="${JENKINS_SWARM_OPTS} -executors $JENKINS_SWARM_EXECUTORS"
fi

if [ "_${JENKINS_SWARM_SSL_VERIFICATION}" == "_false" ]; then
  JENKINS_SWARM_OPTS="${JENKINS_SWARM_OPTS} -disableSslVerification"
fi

java -jar ${JAR} ${JENKINS_SWARM_OPTS} ${JENKINS_SWARM_EXTRA}
