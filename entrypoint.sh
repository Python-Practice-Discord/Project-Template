#!/bin/sh

set -e

cp -r ~/.venv ./.venv

. ./.venv/bin/activate

exec $@
