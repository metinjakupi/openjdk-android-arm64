#!/bin/bash
# Pack the exact OpenJDK source this build compiled - the upstream tag with
# the Android patches already applied - to publish next to the binary
# (GPLv2 with Classpath Exception: binaries ship with their source).
set -e
. ./pins.sh

out="openjdk-${JDK_TAG}-android-src.tar.xz"
XZ_OPT=-T0 tar -C openjdk --exclude=./build --exclude=./.git -cJf "$out" .
ls -l "$out"
