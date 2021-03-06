#!/usr/bin/env bash

pushd $(dirname "$0")
DIR=$(pwd)
RUNBOX="${DIR}/runbox"

echo ${RUNBOX}
# Create runbox
mkdir -p ${RUNBOX}

# Copy source to runbox
cp -fv ${DIR}/Main.java ${RUNBOX}/Main.java
cp -fv ${DIR}/run.stdin ${RUNBOX}/run.stdin

# Test Compile
docker run \
    --cpus="1" \
    --memory="100m" \
    --ulimit nofile=64:64 \
    --rm \
    --read-only \
    -v "$RUNBOX":/usr/src/runbox \
    -w /usr/src/runbox atishaya/judge-worker-java8 \
    bash -c "/bin/compile.sh && /bin/run.sh 1"

ls -lh ${RUNBOX}
expected="Hello World"
actual="$(cat ${RUNBOX}/run.stdout)"
signal="$(cat ${RUNBOX}/run.signal)"
if [ "$expected" == "$actual" ] ;then
    echo ${signal}
else
    echo "MISMATCH: Expected = $expected; Actual = $actual"
    exit 1
fi


# Delete runbox
rm -rf ${RUNBOX}
