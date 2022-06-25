#!/bin/sh
# vim:sw=4:ts=4:et

set -e

if [ -z "${APP_ENV_VALUES:-}" ]; then
  echo ""
else
  echo "APP_ENV_VALUES found"
  echo "${APP_ENV_VALUES}" > values.env
  source values.env
  echo "sourced 'APP_ENV_VALUES' from 'values.env' file"
fi

exec "$@"
