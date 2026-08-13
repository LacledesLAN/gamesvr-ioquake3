#!/bin/bash
set -e;
set -o pipefail;
set -u;

#######################################################################################################################
#######################################################################################################################
dockerfile_path='linux.Dockerfile';
docker_tag='lacledeslan/gamesvr-ioquake3:latest';
docker_test_command=(/app/ioq3ded +exec server-ffa.cfg +exec docker-tester.cfg);
#######################################################################################################################
#######################################################################################################################


#
# PREFLIGHT
#
SOURCE_COMMIT="unspecified";
if command -v git &> /dev/null && git rev-parse --git-dir &> /dev/null; then
    SOURCE_COMMIT=$(git rev-parse --short HEAD)$([ -n "$(git status --porcelain)" ] && echo "-dirty");
    echo -e "# Building $docker_tag from \`$SOURCE_COMMIT\` on $(hostname)";
    else
    echo -e "# Building $docker_tag on $(hostname)";
fi

# Verify docker command-line tool exists
if ! command -v docker &> /dev/null; then
    echo "ERROR: Docker is not installed or not in your PATH." >&2
    exit 1
fi
if ! docker info &> /dev/null; then
    echo "ERROR: Docker is installed, but the current user cannot access the Docker daemon." >&2
    exit 1
fi


#
# Parse command line options
#
option_skip_pull=false;					# Skip pulling the latest base image?
option_skip_tests=false;				# Skip running tests?
option_skip_push_dockerhub=false;		# Skip pushing to Docker Hub?

while [ "$#" -gt 0 ]
do
	case "$1" in
		# options
		--skip-pull)
			option_skip_pull=true;
			;;
		--skip-tests)
			option_skip_tests=true;
			;;
		--skip-push-dockerhub)
			option_skip_push_dockerhub=true;
			;;
		# unknown
		*)
			echo "Error: unknown option '${1}'. Exiting." >&2;
			exit 12;
			;;
	esac
	shift
done


#
# Build the Docker image
#
if [ "$option_skip_pull" != 'true' ]; then
    docker build . --pull -f "$dockerfile_path" --rm -t "$docker_tag" --build-arg BUILDNODE="$(hostname)" --build-arg SOURCE_COMMIT="$SOURCE_COMMIT";
else
    echo "Skipping pulling the latest base image";
	docker build . -f "$dockerfile_path" --rm -t "$docker_tag" --build-arg BUILDNODE="$(hostname)" --build-arg SOURCE_COMMIT="$SOURCE_COMMIT";
fi


#
# Run tests for the Docker image unless skipped
#
echo -e "## Running Tests\n"

if [ "$option_skip_tests" = 'true' ]; then
	echo "No tests to run";
fi;


#
# Push the Docker image to Docker Hub unless skipped
#
echo -e "## Pushing to Docker Hub\n"

if [ "$option_skip_push_dockerhub" != 'true' ]; then
	docker push "$docker_tag";
else
	echo "Skipping push to Docker Hub";
fi;


#
# ALL DONE
#
echo -e "**Job's Done**\n"
