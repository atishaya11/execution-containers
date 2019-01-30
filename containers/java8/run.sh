#!/usr/bin/env bash

name=$(echo *.java | cut -f 1 -d '.')

START_TIME=`date +%s%N`
timeout -k ${1} ${1} java ${name} < run.stdin 1> run.stdout 2> run.stderr
echo $? > run.timeout_signal
END_TIME=`date +%s%N`
runtime=$((END_TIME-START_TIME))
echo $((runtime/1000000)) > run.time



