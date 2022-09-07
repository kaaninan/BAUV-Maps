# syntax=docker/dockerfile:1
FROM node:16-bullseye

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

RUN curl http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_2.0.3-0ubuntu1_amd64.deb --output libjpeg-turbo8_2.0.3-0ubuntu1_amd64.deb
RUN curl http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu66_66.1-2ubuntu2_amd64.deb --output libicu66_66.1-2ubuntu2_amd64.deb
RUN apt install ./libjpeg-turbo8_2.0.3-0ubuntu1_amd64.deb
RUN apt install ./libicu66_66.1-2ubuntu2_amd64.deb
RUN npm install -g pm2

# for tileserver-gl
ENV CHOKIDAR_USEPOLLING=1
ENV CHOKIDAR_INTERVAL=500

# Copy project files
COPY . /usr/src/server

# Install app dependencies
RUN cd /usr/src/server && npm ci
RUN cd /usr/src/server/lib/tileserver-gl && npm ci

# Expose ports
EXPOSE 8000
EXPOSE 8001

WORKDIR /usr/src/server
ENTRYPOINT ["/usr/src/server/docker-entrypoint.sh", "-p", "8000", "-c", "/usr/src/server/src/tileserver/config.json"]
# CMD ["--public_url", "http://IP_ADDRESS:8000"]