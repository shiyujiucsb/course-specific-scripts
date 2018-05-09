#!/usr/bin/env bash

# @test{"stdout":10}
./hello

# @test{"stdout":10}
./hello < sample.stdin

# @test{"stdout":10}
echo "sample input" | ./hello

