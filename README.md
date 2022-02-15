# Harmonoid Custom Codec

[Harmonoid](https://github.com/harmonoid/harmonoid)'s [mpv](https://github.com/mpv-player/mpv) build setup for Windows x64. The application dynamically links to libmpv (`mpv-2.dll`) on Windows for audio playback.

## Introduction

A collection of CMake/Bash scripts to cross-compile mpv & libmpv for Windows x64. The project is a fork of [shinchiro/mpv-winbuild-cmake](https://github.com/shinchiro/mpv-winbuild-cmake).

This setup generates a minimal mpv build, most noticably disabling the video output/encoding related libraries to keep the build just audio playback focused & other GPL libraries to support current [Harmonoid](https://github.com/harmonoid/harmonoid) licensing/distribution model. The latest build can be found in the [Releases](https://github.com/alexmercerind/harmonoid-custom-codec/releases) tab, which is generated using GitHub actions.

The generated mpv/libmpv binary with this configuration is LGPL compatible & users are free to update/replace/change to their own preferred libmpv version by replacing the `mpv-2.dll` file present in Harmonoid's application directory.

## Building

The building steps & commands can be found in the GitHub actions [workflow file](https://github.com/alexmercerind/harmonoid-custom-codec/blob/main/.github/workflows/ci.yml).

## Configuration

### mpv

Following compilation configuration flags were used to build mpv:

```bash
--disable-gl
--enable-lgpl
--enable-static-build
--enable-pdf-build
--disable-manpage-build
--enable-libmpv-shared
--enable-lua
--enable-javascript
--enable-libarchive
--enable-libbluray
--enable-uchardet
--enable-lcms2
--enable-openal
--disable-libplacebo
--disable-egl-angle-lib
```

### FFmpeg

Following compilation configuration flags were used to build FFmpeg used by mpv:

```bash
--target-os=mingw32
--target-exec=wine
--pkg-config-flags=--static
--enable-cross-compile
--enable-runtime-cpudetect
--enable-postproc
--enable-libass
--enable-libbluray
--enable-libfreetype
--enable-libfribidi
--enable-libmodplug
--enable-libmp3lame
--enable-libopus
--enable-libsoxr
--enable-libspeex
--enable-libvorbis
--enable-libwebp
--enable-libzimg
--enable-schannel
--enable-libxml2
--enable-cuda
--enable-cuvid
--enable-nvdec
--enable-nvenc
--enable-libmysofa
--enable-amf
--enable-libmfx
--enable-libdav1d
--disable-debug
--disable-doc
--disable-programs
"--extra-libs='-lsecurity -lschannel'"
"--extra-cflags=-DMODPLUG_STATIC"
```
