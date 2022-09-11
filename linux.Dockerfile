# escape=`
FROM debian:bullseye-slim AS ioq3-builder

RUN apt-get update && apt-get install -y`
    gcc git libsdl2-dev make --no-install-recommends

COPY ./source/ioq3 /ioq3

WORKDIR /ioq3

RUN make

FROM debian:bullseye-slim

ARG BUILDNODE=unspecified
ARG SOURCE_COMMIT=unspecified

HEALTHCHECK NONE

EXPOSE 27960/udp

RUN apt-get update && apt-get install -y `
        glib2.0 lib32gcc-s1 locales locales-all tmux &&`
    apt-get clean &&`
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*;

LABEL maintainer="Laclede's LAN <contact @lacledeslan.com>" `
      com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/LacledesLAN/README.1ST" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="Laclede's LAN" `
      org.label-schema.description="ioQuake3 Dedicated Server in Docker" `
      org.label-schema.vcs-url="https://github.com/LacledesLAN/gamesvr-ioquake3"

# Set up Enviornment
RUN useradd --home /app --gid root --system Quake3 &&`
    mkdir -p /app/ll-tests &&`
    chown Quake3:root -R /app;

# `RUN true` lines are work around for https://github.com/moby/moby/issues/36573
COPY --chown=Quake3:root --from=ioq3-builder /ioq3/build/release-linux-x86_64/ioq3ded.x86_64 /app
RUN true

COPY --chown=Quake3:root ./dist/app /app/

USER Quake3

WORKDIR /app

CMD ["/bin/bash"]

ONBUILD USER root
