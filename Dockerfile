# Stage 1: Build Jenkins Agent with Java, Helm, AWS CLI, and Maven
FROM openjdk:11-jdk-slim AS build-agent

# Install necessary tools and packages
RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Install Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    rm get_helm.sh

# Install AWS CLI
RUN curl -fsSL -o awscliv2.zip "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws awscliv2.zip

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

# Stage 2: Create the Jenkins Agent
FROM jenkins/agent as agent

# Copy tools from the build stage
COPY --from=build-agent /usr/local/bin/helm /usr/local/bin/helm
COPY --from=build-agent /usr/local/bin/aws /usr/local/bin/aws
COPY --from=build-agent /usr/share/maven /usr/share/maven

CMD ["java", "-jar", "/usr/share/jenkins/agent.jar"]

