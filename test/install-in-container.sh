#!/bin/bash
set -e

echo "Testing installation of packages in container: ${PKG}"
docker run --rm -it opam-repo-dev bash /opam-repo-dev/test/install-package.sh $PKG
