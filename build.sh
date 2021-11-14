#!/bin/bash
# use musl-cross-make and build
# invoke: ./build.sh [config variant] [target] [previous-toolchain, if any]

# exit on failure
set -e

# copy the config
cp -v config.mak.$1 musl-cross-make/config.mak
sed -i s/__TARGET__/$2/g musl-cross-make/config.mak

# if we have a previous toolchain, set it in the path
if [ ! -z $3 ]; then
  export PATH="$(realpath $3):$PATH"
fi

# kickoff the build
cd musl-cross-make
make
make install