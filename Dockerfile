FROM ubuntu:18.04
ENV GIT_SSL_NO_VERIFY 1
RUN apt-get -y update
RUN apt -y install build-essential
RUN apt -y install clang
COPY devenv /home/devenv
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
