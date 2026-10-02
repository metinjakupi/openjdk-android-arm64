# openjdk-android-arm64

OpenJDK 21 runtime (JRE) for Android on 64-bit ARM (bionic), built from source with every input pinned.

Forked from [FCL-Team/Android-OpenJDK-Build](https://github.com/FCL-Team/Android-OpenJDK-Build), branch `Build_JRE_21.0.12.1`. Their Android patches and build scripts do the real work; see [UPSTREAM_README.md](UPSTREAM_README.md). This fork:

- builds arm64 only;
- pins every download in [`pins.sh`](pins.sh) and stops on any mismatch;
- publishes each tagged build as a permanent release, together with its complete corresponding source.

## Releases

Tags are named `jre21-<openjdk version>-<build>`, for example `jre21-21.0.12.1-1`. Each release has:

| File | What |
|---|---|
| `jre21-arm64-<date>-release.tar.xz` | the runtime |
| `openjdk-<tag>-android-src.tar.xz` | the exact source it was built from: OpenJDK with `patches/` applied |
| `SHA256SUMS` | checksums of both |

## Moving to a new OpenJDK update

1. In `pins.sh`, set `JDK_TAG` and `JDK_COMMIT` (`git ls-remote https://github.com/openjdk/jdk21u 'refs/tags/<tag>^{}'`).
2. Push, then run the workflow by hand (Actions → Build JRE 21 for Android arm64 → Run workflow) and test the artifact.
3. Tag it to publish: `git tag jre21-<version>-1 && git push origin jre21-<version>-1`.

If the patches no longer apply, check upstream for updated ones.

## Licences

OpenJDK, and the patches in `patches/` as modifications of it, are licensed under GPLv2 with the Classpath Exception. The build scripts come from the upstream repository.
