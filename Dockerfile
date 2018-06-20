FROM jenkins/jenkins:lts
LABEL maintainer="Seunguk Lee <lsy931106@gmail.com>"

USER root

ENV DOCKERVERSION=17.05.0-ce
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-${DOCKERVERSION}.tgz
RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose