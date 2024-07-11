FROM debian:bullseye-slim
LABEL authors="alasdiablo"

RUN apt update && apt install -y curl zip wget

# install Java 21
RUN curl -s "https://get.sdkman.io" | bash
RUN /bin/bash -c "source \"$HOME/.sdkman/bin/sdkman-init.sh\" && sdk install java 21.0.3-tem "

WORKDIR /app/bin

RUN wget https://github.com/inception-project/inception/releases/download/inception-33.2/inception-app-webapp-33.2-standalone.jar


WORKDIR /app
RUN mkdir "data"

RUN echo '' > /app/data/settings.properties

RUN echo '{ \
    "httpPort": 8080, \
    "configPath": "/app/data/settings.properties", \
    "dataPath": "/app/data" \
    }' > /etc/ezmaster.json

COPY docker-entrypoint.sh /app/docker-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["java", "-Dinception.home=/app/data", "-jar", "/app/bin/inception-app-webapp-33.2-standalone.jar"]
