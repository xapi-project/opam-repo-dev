#!/bin/bash
set -e

PKG=$1

if [ -z $PKG ]; then
  echo "Usage $(basename $0) <package>"
  exit 1
fi

export OPAMYES=1

echo "Testing package ${PKG}:"
opam info ${PKG}

echo "Installing external dependencies for ${PKG} ..."
yes | opam depext ${PKG}

echo "Installing package: ${PKG} ..."
opam install ${PKG}
