FROM eclipse-temurin:17-jdk-alpine
RUN apk --no-cache add curl
VOLUME /tmp
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]