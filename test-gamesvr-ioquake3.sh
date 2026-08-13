#!/bin/bash
set -euo pipefail

if (( $# != 1 )); then
    printf 'ERROR: Expected exactly one unqualified local image tag.\n' >&2
    exit 2
fi

image_tag="$1"
if [[ "$image_tag" != gamesvr-ioquake3 && "$image_tag" != gamesvr-ioquake3:* ]]; then
    printf "ERROR: Invalid unqualified image tag for gamesvr-ioquake3: '%s'.\n" "$image_tag" >&2
    exit 2
fi

container_name="gamesvr-ioquake3-test-${BASHPID}"
trap 'docker container rm --force "$container_name" > /dev/null 2>&1 || true' EXIT

docker run --detach --name "$container_name" "$image_tag" /app/ioq3ded +exec server-ffa.cfg +exec docker-tester.cfg > /dev/null
for ((attempt = 1; attempt <= 60; attempt++)); do
    if docker logs "$container_name" 2>&1 | grep -Fq 'DOCKER-TESTER CONFIG LOADED'; then
        exit 0
    fi
    if [[ "$(docker container inspect --format '{{.State.Running}}' "$container_name")" != true ]]; then
        docker logs "$container_name" >&2
        printf 'ERROR: ioquake3 exited before its test configuration loaded.\n' >&2
        exit 1
    fi
    sleep 1
done

docker logs "$container_name" >&2
printf 'ERROR: Timed out waiting for the ioquake3 test configuration.\n' >&2
exit 1