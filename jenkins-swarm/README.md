# Jenkins Swarm
Run Jenkins [Swarm slaves](https://wiki.jenkins.io/display/JENKINS/Swarm+Plugin)

## Running

To run a Docker container customizing the different tools with your credentials

    docker run \
    -e JENKINS_USERNAME=jenkins \
    -e JENKINS_PASSWORD=jenkins \
    -e JENKINS_MASTER_URL=http://jenkins:8080 \
    ottovazquez:jenkins-swarm


### Environment Variables

| Variable                | Default Value       | Description                                  |
|-------------------------|---------------------|----------------------------------------------|
| JENKINS_MASTER_URL      |                     | Jenkins master URL                           |
| JENKINS_USERNAME        |                     | Username to connect to Jenkins master        |
| JENKINS_PASSWORD        |                     | Password to connect to Jenkins master        |
| JENKINS_SWARM_EXECUTORS | # CPU               | # of concurrent jobs this worker can process |
| JENKINS_SWARM_SSL_VERIFICATION | true         | Verify SSL connection in the HttpClient      |
| JENKINS_SWARM_EXTRA     |                     | Extra properties to be added                 |


The full list of parameters can be found at [Swarm Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) page.
