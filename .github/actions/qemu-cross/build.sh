#!/bin/bash

set -e

# The Ubuntu ports mirror intermittently fails to resolve; retry instead of failing the leg.
for i in 1 2 3 4 5 6; do
    apt-get -o Acquire::Retries=5 update && apt-get -o Acquire::Retries=5 install -y gcc && break
    echo "apt attempt $i failed, retrying"; sleep $((i * 20))
done
command -v gcc >/dev/null

pushd sbt-java-module-info
./sbt publishLocal
popd

SBT_CMD="test"
./sbt -v "${SBT_CMD}"
