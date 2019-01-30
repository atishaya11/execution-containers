#!/usr/bin/env bash
pushd $(dirname "$0")
DIR=$(pwd)
EXECUTE_BOX="${DIR}/execute"

echo ${EXECUTE_BOX}
# Create runbox
mkdir -p ${EXECUTE_BOX}

# Copy source to runbox
cp -fv ${DIR}/source.c ${EXECUTE_BOX}/source.c
cp -fv ${DIR}/run.stdin ${EXECUTE_BOX}/run.stdin

# Test Compile
docker run \
    --cpus="0.5" \
    --memory="20m" \
    --ulimit nofile=64:64 \
    --rm \
    --read-only \
    -v "${EXECUTE_BOX}":/usr/src/runbox \
    -w /usr/src/runbox atishaya/judge-worker-c \
    bash -c "/bin/compile.sh && /bin/run.sh 1"

ls -lh ${EXECUTE_BOX}

expected="Hello World"
actual="$(cat ${EXECUTE_BOX}/run.stdout)"
if [ "$expected" == "$actual" ] ;then
    :
else
    echo "MISMATCH: Expected = $expected; Actual = $actual"
    exit 1
fi

# Delete runbox
rm -rf ${EXECUTE_BOX}