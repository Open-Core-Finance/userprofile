FROM gradle:8.4-jdk17-focal as base
WORKDIR /app
# gitCommit for cache busting
ARG GIT_COMMIT
COPY gradle ./gradle
COPY gradlew ./
COPY gradlew gradlew.bat LICENSE ./
COPY *.gradle *.properties ./
COPY src ./src
COPY build_and_mv.sh ./
RUN chmod +x build_and_mv.sh && bash build_and_mv.sh

FROM eclipse-temurin:17-jdk-focal
# FROM openjdk:17-jdk
COPY --from=base /app/*.jar /app/
CMD [ "java -jar /app/*.jar" ]