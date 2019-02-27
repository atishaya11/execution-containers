#!/usr/bin/env bash

chmod 777 exe
START_TIME=`date +%s%N`
timeout -k ${1} ${1} ./exe < run.stdin 1> run.stdout 2> run.stderr
echo $? > run.signal
END_TIME=`date +%s%N`
runtime=$((END_TIME-START_TIME))
echo $((runtime/1000000)) > run.time