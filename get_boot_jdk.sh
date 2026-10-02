#!/bin/bash
set -e
. set_devkit_path.sh
. ./pins.sh

# Get jdk20
wget https://download.java.net/java/GA/jdk20/bdc68b4b9cbc4ebcb30745c85038d91d/36/GPL/openjdk-20_linux-x64_bin.tar.gz
check_sum 256 "$BOOT_JDK_SHA256" openjdk-20_linux-x64_bin.tar.gz
tar xvf openjdk-20*.tar.gz
