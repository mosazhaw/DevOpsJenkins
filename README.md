# DevOpsJenkins

originally inspired by 
https://hub.docker.com/r/yallalabs/jenkins
https://github.com/faudeltn/Jenkins

### How to set versions for new release

    FROM jenkins/jenkins:2.313 sets Jenkins version
    plugins.txt contains Jenkins plugins versions
    ENV VERSION sets Docker engine version
    
### Build and publish

    docker builder prune --all
    docker build -t innovad/jenkins:2.313.1 .
    docker run -p 8080:8080 --name=jenkins-master-FS22 innovad/jenkins:2.313.1
    docker login
    docker push innovad/jenkins:2.313.1

### How to recreate jobs after fresh install (new volume)
#### Copy original jobs to volume, e.g. on Windows 

    \\wsl$\docker-desktop-data\version-pack-data\community\docker\volumes

#### open shell to container 

    docker exec -it --user root jenkins-XYZ /bin/bash

#### set file permissions

    chown -R jenkins:jenkins $JENKINS_HOME/jobs

### How to recreate Jenkins settings after fresh install
#### add NPM as a global tool
#### add docker builder URL in Jenkins configuration
#### add docker clouds

