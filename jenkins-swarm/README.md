# jenkins-slaves
Jenkin swarm slaves with docker installed and accessible to docker slave.


## Running

To run a Docker container customizing the different tools with your credentials

    docker run \
    -e JENKINS_USERNAME=jenkins \
    -e JENKINS_PASSWORD=jenkins \
    -e JENKINS_MASTER=http://jenkins:8080 \
    jenkins-slave


### Optional Environment Variables

You can specify optional environment variables below when invoking docker run to customize the behavior of the swarm client.

| Parameter               | Default Value       | Description                                                                |
|-------------------------|---------------------|----------------------------------------------------------------------------|
| JENKINS_SLAVE_EXECUTORS | number of cpu cores | This value specifies the number of concurrent jobs this worker can process |
| JENKINS_SLAVE_NAME      | swarm-client        | This value specifies the name of slave that will appear on Jenkins UI      |
| JENKINS_SLAVE_LABELS    |                     | This value specifies the labels you want to give for the launching slave   |
| JENKINS_SWARM_EXTRA     |                     | Extra properties to be added                                               |


The full list of parameters can be found at [Swarm Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) page.
