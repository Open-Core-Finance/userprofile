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
RUN chmod +x build_and_mv.sh && chmod +x run_java_app.sh && bash build_and_mv.sh

FROM eclipse-temurin:17-jdk-focal
# FROM openjdk:17-jdk
COPY --from=base /app/*.jar /app/
COPY --from=base /app/run_java_app.sh /app/
WORKDIR /app
EXPOSE 8080 22
ENV PATH /opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV JAVA_HOME /opt/java/openjdk
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV JAVA_VERSION jdk-17.0.9+9
ENTRYPOINT [ "/bin/bash" ]
# RUN [ "java -jar /app/*.jar" ]
CMD [ "/app/run_java_app.sh" ]