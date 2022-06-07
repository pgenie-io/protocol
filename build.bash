#!/bin/bash
set -eo pipefail

function process_openapi {
  openapi-generator generate \
  -i v1.openapi.yaml \
  -o genned-api-for/$1 \
  -g $1
}

rm -rf genned-api-for
process_openapi haskell
process_openapi haskell-http-client
