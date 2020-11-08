---

title: Debugging Spring Applications in Docker
date: 2020-11-05 23:23:00.000000000 +02:00
type: post
published: true
status: publish
categories: 
- development
tags:
- development
author: Oliver van Porten

excerpt: Ever wanted to debug you Spring (Boot) application that is deployed with 
  docker compose directly from IntelliJ? Here is how.

header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/mac_870x580.png
---

Today I am going to talk about how to connect IntelliJ to a Spring Boot app deployed in a docker container
and let you debug it in there instead of e.g. launching it from IntelliJ. 

So, why would you even want to do this? In my case, I have a bunch of containers that get deployed together
through ``docker-compose``, let's call that the API layer. I have another bunch of containers that get deployed independently, but rely on these containers to be present in the docker network with specific names. Let's call that the
UI layer. 

My goal was to be able to trigger an action from the UI layer that interacts with the API layer, and then be able
to step through the code in the API layer's spring application.

Example:


https://spring.io/guides/topicals/spring-boot-docker/
https://spring.io/guides/gs/rest-service/

Dockerfile is

```docker
FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```


```bash

git clone https://github.com/spring-guides/gs-rest-service.git

cd gs-rest-service/complete/
mvn clean install

cd ../..

docker build --build-arg JAR_FILE=gs-rest-service/complete/target/*.jar -t myorg/myapp .

docker run -p 8080:8080 myorg/myapp

ctrl-c

```

```yaml
version: "3.8"
services:
  web:
    build: 
        context: .
        args:
            JAR_FILE: gs-rest-service/complete/target/*.jar
    ports:
        - "8080:8080"
```

```bash
docker ps

CONTAINER ID        IMAGE                     COMMAND                CREATED             STATUS              PORTS  NAMES
bc5d7795b451        spring_rest_example_web   "java -jar /app.jar"   8 seconds ago       Up 8 seconds        8080/tcp spring_rest_example_web_1
```

https://docs.docker.com/compose/gettingstarted/

http://localhost:8080/greeting

Get simple react app:
https://reactjs.org/docs/add-react-to-a-website.html#add-react-in-one-minute
https://gist.github.com/gaearon/6668a1f6986742109c00a581ce704605/archive/f6c882b6ae18bde42dcf6fdb751aae93495a2275.zip


```bash
docker build -t react .
```