FROM robcaruso/synthea:1
ARG env
RUN rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y gradle
ENV profile=${env}
WORKDIR /service
COPY . /service
RUN sed -i 's/vista.url\=/vista.url\=http\:\/\/vista\:9080\/addpatient/' /service/src/main/resources/application.properties
EXPOSE 8021
ENTRYPOINT cd /service && ./gradlew clean bootRun
