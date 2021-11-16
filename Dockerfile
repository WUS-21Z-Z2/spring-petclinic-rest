FROM openjdk:8-jdk-alpine3.9 AS build

WORKDIR /build
COPY . /build/

RUN ./mvnw package

FROM openjdk:8-jdk-alpine3.9
COPY --from=build /build/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
