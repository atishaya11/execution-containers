#! /usr/bin/env bats

@test "test c" {
  bash tests/c/test_worker.sh
}

@test "test cpp" {
  bash tests/cpp/test_worker.sh
}

@test "test java8" {
  bash tests/java8/test_worker.sh
}

@test "test python3" {
  bash tests/java8/test_worker.sh
}