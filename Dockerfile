# Base image, default node image
FROM node:slim
MAINTAINER <Jermine Hu>
LABEL GITBOOK_VERSION="3.2.3"
# Environment configuration
ENV GITBOOK_VERSION="3.2.3"
ADD msyh.ttf /usr/share/fonts/winfonts/msyh.ttf
# Install gitbook
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
  && sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list \
  && apt-get update \
  && apt-get install --no-install-recommends --no-install-suggests -y \
    xfonts-utils \
    calibre \
    bzip2 \
    ghostscript \
    jpegoptim \
    optipng \
  && cd /usr/share/fonts/winfonts \
  && mkfontscale && mkfontdir && fc-cache -fv \
  && npm install --global gitbook-cli markdownlint-cli\
  && npm install svgexport -g --unsafe-perm \
  && gitbook fetch ${GITBOOK_VERSION} \
  && npm cache clear --force \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/*
CMD [ "bash" ]
