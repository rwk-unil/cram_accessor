#!/bin/bash

if ! command -v realpath &> /dev/null
then
    realpath() {
        [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
    }
fi

# Get the path of this script
SCRIPTPATH=$(realpath  $(dirname "$0"))

cd "${SCRIPTPATH}"
cd ..

git pull
make

chmod +x cram_accessor
cp cram_accessor /usr/local/bin