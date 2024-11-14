FROM jenkins/jenkins:2.426.2
USER root
ENV VERSION=27.3.1
# time fix
RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until
RUN apt-get update
# end time fix
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh
RUN usermod -a -G docker jenkins
USER jenkins
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
COPY plugins.txt /usr/share/jenkins/ref/

COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
