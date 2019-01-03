#!/usr/bin/env bash

start=`date +%s`
java Main < run.stdin 1> run.stdout 2> run.stderr
end=`date +%s`
runtime=$((end-start))
echo ${runtime} > run.time