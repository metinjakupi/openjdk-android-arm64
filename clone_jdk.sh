#!/bin/bash
set -e

. ./pins.sh

git clone --branch "$JDK_TAG" --depth 1 https://github.com/openjdk/jdk21u openjdk
check_commit openjdk "$JDK_COMMIT"
