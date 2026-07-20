FROM debian:trixie-slim AS ioq3-builder

RUN apt-get update && apt-get install -y \
    build-essential cmake libsdl2-dev git --no-install-recommends

COPY ./source/ioq3 /ioq3

WORKDIR /ioq3

RUN rm -f .git && \
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_CLIENT=OFF \
        -DBUILD_SERVER=ON \
        -DBUILD_RENDERER_OPENGL1=OFF \
        -DBUILD_RENDERER_OPENGL2=OFF \
        -DBUILD_GAME_LIBRARIES=OFF \
        -DBUILD_GAME_QVMS=OFF && \
    cmake --build build --target ioq3ded --parallel


#---------------------------------
FROM debian:trixie-slim

ARG BUILD_DATE=unspecified \
    BUILD_NODE=unspecified \
    GIT_REVISION=unspecified

HEALTHCHECK NONE

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

LABEL architecture="amd64" \
      com.lacledeslan.build-node="$BUILD_NODE" \
      maintainer="Laclede's LAN <contact@lacledeslan.com>" \
      org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.description="ioQuake3 Dedicated Server in Docker" \
      org.opencontainers.image.revision="$GIT_REVISION" \
      org.opencontainers.image.source="https://github.com/LacledesLAN/gamesvr-ioquake3" \
      org.opencontainers.image.vendor="Laclede's LAN"

# Set up Environment
RUN mkdir --parents /app && \
    useradd --home /app --gid root --system Quake3 && \
    chown Quake3:root -R /app;

COPY --chown=Quake3:root --from=ioq3-builder /ioq3/build/Release/ioq3ded /app

COPY --chown=Quake3:root ./dist/app /app/

EXPOSE 27960/udp

USER Quake3

WORKDIR /app

CMD ["/bin/bash"]

ONBUILD USER root
