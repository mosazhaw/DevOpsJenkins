FROM jenkins/agent:3283.v92c105e0f819-1-jdk21

# Install Docker CLI
USER root
RUN apt-get update
RUN apt-get install -y docker.io

# Install NPM required tools
RUN apt-get install -y python3 build-essential

USER jenkins
WORKDIR /home/jenkins