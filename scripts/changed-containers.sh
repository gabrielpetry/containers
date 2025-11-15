#!/usr/bin/env bash

set -euo pipefail

event_before="${1:-}"
sha="${2:-}"

changed="$(git diff --name-only "${event_before}" "${sha}" | grep -Ev '.github|.scripts' | cut -d'/' -f1 | sort -u | tr '\n' ' ' | xargs || echo '')"

echo "containers=${changed}"
