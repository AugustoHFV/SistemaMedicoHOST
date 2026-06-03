FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package
FROM payara/micro:6.2025.1-jdk17
ENV JAVA_TOOL_OPTIONS="-Xmx200m -Xms100m -XX:MaxMetaspaceSize=128m -Xss512k"
COPY --from=build /app/target/*.war $DEPLOY_DIR/ROOT.war
EXPOSE 8080
