# Every outside download the build makes, pinned. Bump these together when
# moving to a new OpenJDK update: the build stops on anything that differs.
export JDK_TAG=jdk-21.0.12.1-ga
export JDK_COMMIT=eac07229cf6cacc8a22eb79f4929e7fed61338b7
# android-ndk-r21-linux-x86_64.zip, SHA-1 from Google's SDK repository list
export NDK_SHA1=afc9c0b9faad222898ac8168c78ad4ccac8a1b5c
# openjdk-20_linux-x64_bin.tar.gz, as published next to the download
export BOOT_JDK_SHA256=bb863b2d542976d1ae4b7b81af3e78b1e4247a64644350b552d298d8dc5980dc
export FREETYPE_SHA256=955e17244e9b38adb0c98df66abb50467312e6bb70eac07e49ce6bd1a20e809a
export CUPS_SHA256=596d4db72651c335469ae5f37b0da72ac9f97d73e30838d787065f559dea98cc
# termux-elf-cleaner v2.2.0
export ELF_CLEANER_COMMIT=d08dfdc73ff5b6061e134b90bec16489655015f5

check_sum() { # <1|256> <expected> <file>
    echo "$2  $3" | "sha$1sum" -c - || { echo "checksum mismatch: $3" >&2; exit 1; }
}

check_commit() { # <dir> <expected>
    local got
    got=$(git -C "$1" rev-parse HEAD)
    [ "$got" = "$2" ] || { echo "$1 is at $got, expected $2" >&2; exit 1; }
}
