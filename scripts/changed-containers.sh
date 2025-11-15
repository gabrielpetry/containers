#!/usr/bin/env bash

set -euo pipefail

event_before="${1:-}"
sha="${2:-}"

changed="$(git diff --name-only "${event_before}" "${sha}" | grep -Ev '.github|scripts' | cut -d'/' -f1 | sort -u | tr '\n' ' ' | xargs || echo '')"

if [[ -z "${changed}" ]]; then
	echo 'containers=[]'
else
	json_array=$(printf '%s\n' "${changed}" | jq -R . | jq -cs .)
	echo "containers=${json_array}"
fi
