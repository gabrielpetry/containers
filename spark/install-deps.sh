#!/bin/bash
set -euo pipefail

# receives a list of urls to downloads to /opt/spark/jars/
for url in "$@"; do
	filename="$(basename "${url}")"
	curl -L -o "/opt/spark/jars/${filename}" "${url}"
	if [[ -f "/opt/spark/jars/${filename}" ]]; then
		echo "Downloaded ${filename} to /opt/spark/jars/"
	else
		echo "Failed to download ${filename}"
		exit 1
	fi
done
