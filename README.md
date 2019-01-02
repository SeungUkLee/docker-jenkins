# :whale: Docker Jenkins
 
Jenkins CI with docker 

This is jenkins customizing [jenkins/jenkins:lts](https://hub.docker.com/r/jenkins/jenkins/).

This is installed **docker-compose** and **docker client**. 

So you can run jenkins pipeline which uses docker-compose or docker. 

Example:
```
node {
    withCredentials([[$class: 'UsernamePasswordMultiBinding',
        credentialsId: 'dockerhub',
        usernameVariable: 'DOCKER_USER_ID',
        passwordVariable: 'DOCKER_USER_PASSWORD']]) {
        stage('Pull') { }
        stage('Unit Test') { }
        stage('Build') {
            sh(script: 'docker-compose build')
        }
        stage('Tag') {
            sh(script: '''docker tag ${DOCKER_USER_ID}/YOUR_PROJECT \
            ${DOCKER_USER_ID}/YOUR_PROJECT:${BUILD_NUMBER}''')
        }
        stage('Push') { }

        stage('Deploy') {
            sh(script: 'docker-compose up -d')
        }
    }
}
```

## Running this container

To run the container, do the following:

```
docker run -p 8080:8080 -p 50000:50000 --name jenkins \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
seunguklee/docker-jenkins
```
