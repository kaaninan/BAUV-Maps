# syntax=docker/dockerfile:1
FROM node:16-bullseye AS builder

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get -qq update \
  && apt-get -y --no-install-recommends install \
      apt-transport-https \
      curl \
      unzip \
      build-essential \
      python \
      libcairo2-dev \
      libgles2-mesa-dev \
      libgbm-dev \
      libprotobuf-dev \
      libgles2-mesa \
      libegl1 \
      xvfb \
      xauth \
      libopengl0 \
      libcurl4 \
      libuv1-dev \
      libc6-dev \
      libcap2-bin \
  && apt-get -y --purge autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/acalcutt/tileserver-gl.git /usr/src/app
COPY . /usr/src/app
ENV NODE_ENV="production"
RUN cd /usr/src/app && npm install --production

RUN curl http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_2.0.3-0ubuntu1_amd64.deb --output libjpeg-turbo8_2.0.3-0ubuntu1_amd64.deb
RUN apt install ./libjpeg-turbo8_2.0.3-0ubuntu1_amd64.deb
RUN curl http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu66_66.1-2ubuntu2_amd64.deb --output libicu66_66.1-2ubuntu2_amd64.deb
RUN apt install ./libicu66_66.1-2ubuntu2_amd64.deb

ENV CHOKIDAR_USEPOLLING=1
ENV CHOKIDAR_INTERVAL=500

# TODO: Import mbtiles and fonts and config file

# VOLUME /data
# WORKDIR /data

# # allow node to listen on low ports
# RUN setcap 'cap_net_bind_service=+ep' /usr/local/bin/node

# EXPOSE 80

# USER node:node

ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]

CMD ["-p", "80"]
