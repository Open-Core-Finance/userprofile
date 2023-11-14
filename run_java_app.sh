#!/bin/bash

echo "Running with env '${RUN_ENV}'"
/opt/java/openjdk/bin/java -jar /app/*.jar ${RUN_ENV}