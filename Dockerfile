# Etapa 1: Compilar el proyecto con Maven y Java 17
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Etapa 2: Montar el archivo en el servidor Payara Micro (Versión 6 para Jakarta 10)
FROM payara/micro:6-jdk17
# Copiamos tu archivo .war y lo renombramos a ROOT.war para que tu página 
# aparezca directamente en el link principal (sin tener que escribir /SistemaMedico)
COPY --from=build /app/target/*.war $DEPLOY_DIR/ROOT.war

# Exponer el puerto que usa Payara y Render
EXPOSE 8080