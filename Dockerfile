# Stage 1: Build Stage
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

COPY . /app

RUN mvn clean package -DskipTests


# Stage 2: Runtime Stage
FROM tomcat:10.1-jdk17

COPY --from=builder /app/target/restaurant.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8012

CMD ["catalina.sh", "run"]
