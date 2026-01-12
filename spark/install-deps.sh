#!/bin/bash
set -euo pipefail

# receives a list of urls to downloads to /opt/spark/jars/
for url in "$@"; do
	filename="$(basename "${url}")"
	curl -L -o "/opt/spark/jars/${filename}" "${url}"
done
