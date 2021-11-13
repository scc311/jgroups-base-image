FROM alpine:latest

ARG JAVA_VERSION=11
RUN apk add --no-cache \
  openjdk${JAVA_VERSION} \
  wget

ARG JGROUPS_VERSION=3.6.20
WORKDIR /java/libs
RUN wget "https://sourceforge.net/projects/javagroups/files/JGroups/${JGROUPS_VERSION}.Final/jgroups-${JGROUPS_VERSION}.Final.jar/download" -O jgroups-${JGROUPS_VERSION}.jar

ENV CLASSPATH=$CLASSPATH:/java/libs/jgroups-${JGROUPS_VERSION}.jar
