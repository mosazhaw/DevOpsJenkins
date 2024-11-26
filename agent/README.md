# Jenkins Agent
    cd agent
    docker builder prune --all
    docker build -t mosazhaw/jenkins-agent:jdk21-1.1 .
    docker login
    docker push mosazhaw/jenkins-agent:jdk21-1.1

### Multi-Platform AMD64, ARM64 (Apple M1, M2)
    if missing: docker buildx create --name devops
    cd agent
    docker login
    docker buildx use devops  
    docker buildx build --push --platform linux/amd64,linux/arm64 -t mosazhaw/jenkins-agent:jdk21-1.1 .
    docker context use default

