#!/bin/bash

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- gsql "$@"
fi
exec "$@"
