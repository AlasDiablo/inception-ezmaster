FROM eclipse-temurin:21-jre-alpine
LABEL authors="alasdiablo"

WORKDIR /app/bin

RUN wget https://github.com/inception-project/inception/releases/download/inception-33.2/inception-app-webapp-33.2-standalone.jar

WORKDIR /app
RUN mkdir "data"

RUN echo '{ \
    "httpPort": 8080, \
    "dataPath": "/app/data" \
    }' > /etc/ezmaster.json

EXPOSE 8080
ENTRYPOINT ["java", "-Dinception.home=/app/data", "-jar", "/app/bin/inception-app-webapp-33.2-standalone.jar"]
