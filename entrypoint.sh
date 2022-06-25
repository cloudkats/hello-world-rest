#!/usr/bin/env bash

set -e

if [ -z "${APP_ENV_VALUES:-}" ]; then
  echo ""
else
  echo "APP_ENV_VALUES found"
  echo "${APP_ENV_VALUES}" > values.env
  unset APP_ENV_VALUES
  echo "sourced 'APP_ENV_VALUES' from 'values.env' file"

  while IFS= read -r line; do
    KEY="${line%%=*}"
    VALUE="${line%%*=}"
    echo "set: $KEY"
    export $KEY=${VALUE}
  done < values.env
fi

exec "$@"
