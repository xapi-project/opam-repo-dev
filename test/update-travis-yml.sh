#!/bin/bash
set -e

if [ $# != 1 ]; then
  echo "usage: $0 .travis.yml"
  exit 1
elif [ ! -f $1 ]; then
  echo "$1: No such file"
  exit 2
fi

TMP=$(mktemp --suffix=$(basename $0))
trap "rm -f ${TMP}" EXIT

PKGS=$(find packages -mindepth 2 -maxdepth 2 -type d -printf '%f\n' | sort -u)

sed '/- PKG=.*/d' $1 | sed '/env:.*/d' >> ${TMP}
echo "env:" >> ${TMP}
for p in ${PKGS}; do
  echo "  - PKG=$p" >> ${TMP}
done

cat ${TMP}
read -n 1 -rp "Re-write $1 with the above contents? [y/N] "
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  mv ${TMP} $1
else
  echo "Aborting as requested."
fi
