#!/bin/bash
set -e

PKGS=$(find packages -mindepth 2 -maxdepth 2 -type d -printf '%f\n' | sort -u)

echo "Building Docker image for testing..."
docker build -t opam-repo-dev .

for p in ${PKGS}; do
  echo "Testing installation of packages in container: ${p}"
  docker run --rm -it opam-repo-dev bash /opam-repo-dev/test/install-package.sh $p
done
