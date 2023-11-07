FROM ubuntu:focal
ARG DEBIAN_FRONTEND=noninteractive
ARG USERNAME=nginx
ARG USER_UID=101
ARG USER_GID=$USER_UID
ARG UMDS_INSTALLER=VMware-UMDS-8.0.2.00100-11979815.tar.gz
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt update \
    && apt upgrade -y \
    && apt install -y psmisc ca-certificates libgssapi-krb5-2 libldap-2.4-2 \
    && rm -rf /var/lib/apt/lists/*
ADD ./install/$UMDS_INSTALLER /tmp/
ADD ./install/installumds.sh /tmp/
ADD entrypoint.sh /
RUN /tmp/installumds.sh \ 
    && rm -rf /tmp/*
USER $USERNAME
CMD ["/entrypoint.sh"]