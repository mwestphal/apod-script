#!/usr/bin/env bash
set -eu

URL='https://apod.nasa.gov/apod/'
OUTPUT='/path/to/output/apod.jpg'
PATTERN='^.*\?"\(image\/.*\?\)".*'

mkdir -p "${OUTPUT%/*}"
curl -so "$OUTPUT" "$URL$( \
  curl -s "$URL" | \
  sed -ns "0,/$PATTERN/s/$PATTERN/\\1/p" \
)"
