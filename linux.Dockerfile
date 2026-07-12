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

FROM debian:trixie-slim

ARG BUILDNODE=unspecified
ARG SOURCE_COMMIT=unspecified

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

EXPOSE 27960/udp

HEALTHCHECK NONE

LABEL architecture="amd64" \
      maintainer="Laclede's LAN <contact@lacledeslan.com>" \
      com.lacledeslan.build-node=$BUILDNODE \
      org.label-schema.schema-version="1.0" \
      org.label-schema.url="https://github.com/LacledesLAN/README.1ST" \
      org.opencontainers.image.description="ioQuake3 Dedicated Server in Docker" \
      org.opencontainers.image.revision=$SOURCE_COMMIT \
      org.opencontainers.image.source="https://github.com/LacledesLAN/gamesvr-ioquake3" \
      org.opencontainers.image.vendor="Laclede's LAN"

# Set up Environment
RUN mkdir --parents /app && \
    useradd --home /app --gid root --system Quake3 && \
    chown Quake3:root -R /app;

# `RUN true` lines are work around for https://github.com/moby/moby/issues/36573
COPY --chown=Quake3:root --from=ioq3-builder /ioq3/build/Release/ioq3ded /app
RUN true

COPY --chown=Quake3:root ./dist/app /app/

USER Quake3

WORKDIR /app

CMD ["/bin/bash"]

ONBUILD USER root
