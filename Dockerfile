FROM gradle:8.4-jdk17-focal as base
WORKDIR /app
# gitCommit for cache busting
ARG GIT_COMMIT
COPY gradle ./gradle
COPY gradlew ./
COPY gradlew gradlew.bat LICENSE ./
COPY *.gradle *.properties ./
COPY src ./src
COPY build_and_mv.sh run_java_app.sh ./
RUN chmod +x build_and_mv.sh && bash build_and_mv.sh

FROM eclipse-temurin:17-jdk-focal
# FROM openjdk:17-jdk
WORKDIR /app
COPY --from=base /app/*.jar ./
COPY run_java_app.sh ./
RUN chmod +x /app/run_java_app.sh
WORKDIR /app
EXPOSE 8080 22
ENV PATH /opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV JAVA_HOME /opt/java/openjdk
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV JAVA_VERSION jdk-17.0.9+9
ENV RUN_ENV --spring.datasource.url=jdbc:postgresql://host.docker.internal:5432/core_finance_userprofile
ENTRYPOINT [ "/bin/bash" ]
# RUN [ "java -jar /app/*.jar" ]
CMD [ "/app/run_java_app.sh" ]