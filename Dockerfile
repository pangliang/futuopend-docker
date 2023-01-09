FROM ubuntu:16.04

# RUN sed -i "s@archive.ubuntu.com@mirrors.aliyun.com@g" /etc/apt/sources.list \
#     && sed -i "s@security.ubuntu.com@mirrors.aliyun.com@g" /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y wget procps telnet

ARG VERSION
ENV SDK_NAME=FutuOpenD_${VERSION}_NN_Ubuntu16.04

RUN wget -O - https://softwarefile.futunn.com/${SDK_NAME}.tar.gz | tar -xzf - -C /
RUN rm -rf /${SDK_NAME}/FutuOpenD-GUI_${VERSION}_NN_Ubuntu16.04 \
    && ln -s /${SDK_NAME}/${SDK_NAME} /FutuOpenD

WORKDIR /FutuOpenD
COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]