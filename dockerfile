# escape=`
FROM lacledeslan/steamcmd:linux as quake3-builder

ARG contentServer=content.lacledeslan.net

RUN     echo "\nDownloading io from $contentServer" &&`
        mkdir --parents /tmp &&`
        echo "\nDOWNLOADING ioquake3  SERVER" &&`
        curl "http://content.lacledeslan.net/fastDownloads/_installers/ioq3ded.x86_64" -o /output/ioq3ded.x86_64

#=======================================================================`

FROM debian:stable-slim

ARG BUILDNODE=unspecified
ARG SOURCE_COMMIT=unspecified

HEALTHCHECK NONE

EXPOSE 27960/udp

RUN dpkg --add-architecture i386 &&`
    apt-get update && apt-get install -y `
        glib2.0 lib32gcc-s1 locales locales-all tmux zlib1g:i386 zlib1g &&`
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
COPY --chown=Quake3:root --from=quake3-builder /output /app
RUN true

COPY --chown=Quake3:root ./dist/linux/ll-tests /app/ll-tests

RUN chmod +x /app/ll-tests/*.sh && chmod +x /app/ioq3ded.x86_64 

COPY --chown=Quake3:root ./dist/app /app/

USER Quake3

WORKDIR /app

CMD ["/bin/bash"]

ONBUILD USER root
