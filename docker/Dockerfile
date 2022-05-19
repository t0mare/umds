FROM debian:stable-slim
ARG DEBIAN_FRONTEND=noninteractive
ARG USERNAME=nginx
ARG USER_UID=101
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt update \
    && apt upgrade -y \
    && apt install -y psmisc ca-certificates \
    && rm -rf /var/lib/apt/lists/*
ADD ./install/VMware-UMDS-7.0.3.00300-9499375.tar.gz /tmp/
ADD ./install/installumds.sh /tmp/
ADD entrypoint.sh /
RUN /tmp/installumds.sh \ 
    && rm -rf /tmp/*
USER $USERNAME
CMD ["/entrypoint.sh"]