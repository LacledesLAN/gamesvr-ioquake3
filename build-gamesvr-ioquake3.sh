#!/bin/bash
set -e;
set -o pipefail;
set -u;

exec 3>&1
exec 1>&2

printf '## Build gamesvr-ioquake3\n\n'

created_image_tags=()
command_fence_open=false

record_image_tag() {
	local image_tag="$1"
	local existing_tag

	for existing_tag in "${created_image_tags[@]+"${created_image_tags[@]}"}"; do
		[[ "$existing_tag" == "$image_tag" ]] && return 0
	done
	created_image_tags+=("$image_tag")
}

run_fenced() {
	local command_status=0
	local escape_character=$'\033'

	printf '````````console\n'
	command_fence_open=true
	if "$@" 2>&1 | tr '\r' '\n' | sed -E "s/${escape_character}\\[[0-9;?]*[[:alpha:]]//g"; then
		command_status=${PIPESTATUS[0]}
	else
		command_status=${PIPESTATUS[0]}
	fi
	command_fence_open=false
	printf '````````\n\n'
	return "$command_status"
}

on_exit() {
	local exit_status=$?

	trap - EXIT HUP INT TERM PIPE
	trap '' HUP INT TERM PIPE
	set +e
	if [[ "$command_fence_open" == true ]]; then
		printf '````````\n\n'
		command_fence_open=false
	fi
	if (( ${#created_image_tags[@]} > 0 )); then
		printf '\n### Completed images\n\n' >&2
	fi
	exec 1>&3
	if (( ${#created_image_tags[@]} > 0 )); then
		printf '%s\n' "${created_image_tags[@]}" 2>/dev/null || true
	fi
	exit "$exit_status"
}

trap on_exit EXIT
trap 'exit 129' HUP
trap 'exit 130' INT
trap 'exit 143' TERM

#######################################################################################################################
#######################################################################################################################
dockerfile_path='linux.Dockerfile';
local_docker_tag='gamesvr-ioquake3:latest';
docker_tag='lacledeslan/gamesvr-ioquake3:latest';
#######################################################################################################################
#######################################################################################################################


#
# Parse command line options
#
build_options=()

while [ "$#" -gt 0 ]
do
	case "$1" in
		--delta) build_options+=('--delta') ;;
		--enable-steamcmd-cache) build_options+=('--enable-steamcmd-cache') ;;
		--disable-docker-cache) build_options+=('--disable-docker-cache') ;;
		--progress-plain) build_options+=('--progress-plain') ;;
		--skip-pull) build_options+=('--skip-pull') ;;
		--skip-tests) build_options+=('--skip-tests') ;;
		--skip-push) build_options+=('--skip-push') ;;
		# unknown
		*)
			echo "Error: unknown option '${1}'. Exiting." >&2;
			exit 12;
			;;
	esac
	shift
done

# DESCRIPTION: Reports whether a common build option was specified.
# PARAMETERS:
#   $1 (option_name) - Canonical command-line option to find in build_options.
# RETURNS:
#   0 - The option is present.
#   1 - The option is absent.
has_build_option() {
	local element
	for element in "${build_options[@]}"; do
		[[ "$element" == "$1" ]] && return 0
	done
	return 1
}

for required_command in date docker git hostname sed tr; do
	if ! command -v "$required_command" > /dev/null 2>&1; then
		printf "ERROR: Required command '%s' is not installed or not in PATH.\n" "$required_command" >&2
		exit 1
	fi
done
if ! docker info > /dev/null 2>&1; then
	printf "ERROR: Docker is installed, but the current user cannot access the Docker daemon.\n" >&2
	exit 1
fi

if ! git rev-parse --git-dir > /dev/null 2>&1; then
	printf "ERROR: The current directory is not a Git repository.\n" >&2
	exit 1
fi
GIT_REVISION=$(git rev-parse HEAD)$([ -n "$(git status --porcelain)" ] && echo "-dirty")
printf "Building \`%s\` from \`%s\` on \`%s\`.\n\n" "$docker_tag" "$GIT_REVISION" "$(hostname)"

if has_build_option '--delta'; then
	echo "--delta has no effect for this project; performing a full build."
fi
if has_build_option '--enable-steamcmd-cache'; then
	echo "--enable-steamcmd-cache has no effect for this project."
fi
if has_build_option '--skip-tests' && ! has_build_option '--skip-push'; then
	echo "WARNING: --skip-tests was specified without --skip-push. The requested images will be pushed without testing." >&2
fi
if ! has_build_option '--skip-tests' && [[ ! -x ./test-gamesvr-ioquake3.sh ]]; then
	echo "ERROR: Required test script is missing or not executable: ./test-gamesvr-ioquake3.sh" >&2
	exit 1
fi

#
# Build the Docker image
#
docker_options=()
if ! has_build_option '--skip-pull'; then
	docker_options+=(--pull)
else
    echo "Skipping pulling the latest base image";
fi
if has_build_option '--disable-docker-cache'; then
	docker_options+=(--no-cache)
fi
if has_build_option '--progress-plain'; then
	docker_options+=(--progress=plain)
fi
printf '### Build\n\n'
run_fenced docker build . "${docker_options[@]}" -f "$dockerfile_path" --rm -t "$local_docker_tag" -t "$docker_tag" --build-arg BUILD_DATE="$(date -u +%Y-%m-%dT%H:%M:%SZ)" --build-arg BUILD_NODE="$(hostname)" --build-arg GIT_REVISION="$GIT_REVISION";
record_image_tag "$local_docker_tag"
record_image_tag "$docker_tag"


#
# Run tests for the Docker image unless skipped
#
printf '### Tests\n\n'

if ! has_build_option '--skip-tests'; then
	run_fenced ./test-gamesvr-ioquake3.sh "$local_docker_tag";
else
	echo "Skipping tests because --skip-tests was specified.";
fi;


#
# Push the Docker image to Docker Hub unless skipped
#
printf '### Push\n\n'

if ! has_build_option '--skip-push'; then
	run_fenced docker push "$docker_tag";
else
	echo "Skipping push to Docker Hub because --skip-push was specified.";
fi;


#
# ALL DONE
#
echo -e "**Job's Done**\n"
