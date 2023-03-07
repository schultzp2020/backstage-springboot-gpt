FROM registry.access.redhat.com/ubi8/openjdk-11:1.11

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve

COPY src ./src

ENV PORT 5000
EXPOSE 5000

CMD ["./mvnw", "spring-boot:run"]
