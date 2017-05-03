FROM java:openjdk-8u111-jre

# https://github.com/jenkinsci/docker/blob/38a7f8a3700d6637a6f08ff563beaef9926ce5ee/Dockerfile
LABEL maintainer "Otto Vazquez <otto.vazquez@gmail.com>"

ENV JENKINS_HOME=/var/jenkins_home
ENV JENKINS_SWARM_VERSION=3.4
ENV RANCHER_VERSION=0.5.2
ENV DOCKER_VERSION=17.04.0-ce
ENV DOCKER_COMPOSE_VERSION=1.13.0

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

COPY cmd.sh /cmd.sh

RUN \
  groupadd -g ${gid} ${group} &&\
  useradd -d "${JENKINS_HOME}" -u ${uid} -g ${gid} -m -s /bin/bash ${user} &&\
  chmod +x /cmd.sh &&\

  BIN_DIR=/usr/local/bin &&\

  # Jenkins Swarm
  JENKINS_SWARM_FILE="swarm-client-${JENKINS_SWARM_VERSION}.jar" &&\
  JENKINS_SWARM_URL="https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${JENKINS_SWARM_VERSION}/${JENKINS_SWARM_FILE}" &&\
  curl --create-dirs -fsSLo ${JENKINS_HOME}/${JENKINS_SWARM_FILE} "${JENKINS_SWARM_URL}" &&\
  chown -R ${user} ${JENKINS_HOME} &&\

  # Rancher CLI
  RANCHER_URL="https://github.com/rancher/cli/releases/download/v${RANCHER_VERSION}/rancher-linux-amd64-v${RANCHER_VERSION}.tar.gz" &&\
  curl --location-trusted -fsSL ${RANCHER_URL} | tar --strip-components=2 -xz -C ${BIN_DIR} &&\
  chmod +x ${BIN_DIR}/rancher &&\

  # Docker
  DOCKER_URL="https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" &&\
  curl -fsSL ${DOCKER_URL} | tar --strip-components=1 -xz -C ${BIN_DIR} &&\

  # Docker Compose
  DOCKER_COMPOSE_URL="https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64" &&\
  curl -fsSLo ${BIN_DIR}/docker-compose ${DOCKER_COMPOSE_URL} &&\
  chmod +x ${BIN_DIR}/docker-compose

USER ${user}
WORKDIR ${JENKINS_HOME}

VOLUME /var/run/docker.sock

CMD /bin/bash /cmd.sh
