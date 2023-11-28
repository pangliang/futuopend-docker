FROM ubuntu:16.04

# RUN sed -i "s@archive.ubuntu.com@mirrors.aliyun.com@g" /etc/apt/sources.list \
#     && sed -i "s@security.ubuntu.com@mirrors.aliyun.com@g" /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y wget procps telnet jq

ARG VERSION
ENV SDK_NAME=moomoo_OpenD_${VERSION}_Ubuntu16.04

RUN link=`wget -O - https://www.moomoo.com/api/download-link?file=${SDK_NAME}.tar.gz | jq -r '.data.link'`; wget -O - ${link} | tar -xzf - -C /
RUN rm -rf /${SDK_NAME}/moomoo_OpenD-GUI_${VERSION}_Ubuntu16.04 \
    && ln -s /${SDK_NAME}/${SDK_NAME} /OpenD

VOLUME /root/.com.moomoo.OpenD
WORKDIR /OpenD
COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]