FROM openjdk:8-jdk-alpine AS build

RUN apk add --no-cache git
RUN git clone https://github.com/spring-petclinic/spring-petclinic-rest.git

RUN cd spring-petclinic-rest && ./mvnw package

FROM openjdk:8-jdk-alpine
COPY --from=build spring-petclinic-rest/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
