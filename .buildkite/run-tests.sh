#!/usr/bin/env bash
#
# Script to run Elasticsearch container and Elasticsearch client integration tests on Buildkite
#
# Version 0.1
#
script_path=$(dirname $(realpath -s $0))
source $script_path/functions/imports.sh
set -euo pipefail

echo "--- Create the elastic network"
docker network create elastic

echo "--- :elasticsearch: Starting Elasticsearch"
DETACH=true bash $script_path/run-elasticsearch.sh

echo "+++ :ruby: Run Client"
bash $script_path/run-client.sh
