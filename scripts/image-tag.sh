#!/usr/bin/env bash

set -euo pipefail

dir="$1"
[[ -z "${dir}" ]] && {
	echo "Usage: $0 <directory>"
	exit 1
}

version="$(grep -i 'label version' "${dir}/Dockerfile" | cut -d' ' -f2 | cut -d"=" -f2 || true)"

[[ -z "${version}" ]] && {
	echo "No version label found in ${dir}/Dockerfile must be set with 'LABEL version=\"x.y.z\"'"
	exit 1
}

echo "${version}"
