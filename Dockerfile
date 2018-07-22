FROM alpine:3.8

ARG CHROMIUM_GID=8443
ARG CHROMIUM_UID=8080
ARG CHROMIUM_HOME=/chromium

RUN set -x \
 && apk --no-cache add \
    chromium \
    dumb-init \
    mesa-dri-ati \
    mesa-dri-intel \
    mesa-dri-nouveau \
    mesa-dri-virtio \
    mesa-gl \
 && addgroup -g ${CHROMIUM_GID} chromium \
 && adduser -D -G chromium -h ${CHROMIUM_HOME} -u ${CHROMIUM_UID} -S chromium \
 && chromium-browser -version

USER chromium

ENTRYPOINT ["dumb-init", "chromium-browser"]
CMD ["--help"]
