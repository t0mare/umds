FROM debian:stable-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y && apt install -y psmisc ca-certificates && rm -rf /var/lib/apt/lists/*
ADD ./install/VMware-UMDS-7.0.3.00300-9499375.tar.gz /tmp/
ADD ./install/installumds.sh /tmp/
ADD entrypoint.sh /
RUN /tmp/installumds.sh
RUN rm -rf /tmp/*
CMD ["/entrypoint.sh"]