FROM openjdk:8-jdk-alpine
COPY ms1.jar /app.jar
EXPOSE 8101
ENTRYPOINT ["java", "-jar", "/app.jar"]