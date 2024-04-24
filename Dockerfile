FROM openjdk:11

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_VERSION 3.9.2
ENV PATH $MAVEN_HOME/bin:$PATH

RUN apt-get update
RUN apt-get install -y maven
RUN rm -rf /var/lib/apt/lists/*

COPY ./untitled /usr/src/app
WORKDIR /usr/src/app
RUN mvn clean install

CMD ["java", "-jar", "target/docker_maven-1.0-SNAPSHOT.jar"]
