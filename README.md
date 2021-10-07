"# DevOpsJenkins" 

originally inspired by 
https://hub.docker.com/r/yallalabs/jenkins
https://github.com/faudeltn/Jenkins

How to set versions for new release
FROM jenkins/jenkins:2.313 sets Jenkins version
plugins.txt contains Jenkins plugins versions
ENV VERSION sets Docker engine version

How to recreate jobs after fresh install (new volume)
Copy original jobs to volume, e.g. on Windows 
\\wsl$\docker-desktop-data\version-pack-data\community\docker\volumes
open shell to container 
docker exec -it --user root jenkins-XYZ /bin/bash
set file permissions
chown -R jenkins:jenkins $JENKINS_HOME/jobs