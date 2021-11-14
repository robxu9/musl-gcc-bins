#!/bin/bash
# use musl-cross-make and build
# invoke: ./build.sh [target] [cross-toolchain, if any]

# exit on failure, show commands
set -ex

# copy the config
cp -v config.mak musl-cross-make/config.mak
sed -i s/__TARGET__/$1/g musl-cross-make/config.mak

# if we have a cross toolchain, set it in the path
if [ ! -z $2 ]; then
  export PATH="$(realpath $2)/bin:$PATH"
fi

# kickoff the build
cd musl-cross-make
if [ ! -z $2 ]; then
  make NATIVE=1
else
  make
fi
make install