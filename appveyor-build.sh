export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical

sudo -E apt-get -qy update
sudo -E apt-get -m -y install build-essential checkinstall bison flex gettext git mercurial subversion ninja-build gyp cmake yasm nasm automake pkg-config libtool libtool-bin gcc-multilib g++-multilib libgmp-dev libmpfr-dev libmpc-dev libgcrypt-dev gperf ragel texinfo autopoint re2c asciidoc docbook2x unzip p7zip-full curl  python3-pip libjpeg-dev zlib1g-dev
sudo pip3 install rst2pdf meson mako

git config --global core.fileMode false
git config --global user.name "Hitesh Kumar Saini"
git config --global user.email "saini123hitesh@gmail.com"

mkdir build64 && cd build64
cmake -DTARGET_ARCH=x86_64-w64-mingw32 -G Ninja ..

ninja gcc

ninja mpv

cat /home/runner/work/MPV-Windows-LGPL/MPV-Windows-LGPL/build64/packages/mpv-prefix/src/mpv-stamp/mpv-configure-*.log

7z a mpv-dev.7z ./mpv-dev-x86_64*/*
appveyor PushArtifact mpv-dev.7z

7z a mpv-debug.7z ./mpv-debug-x86_64*/*
appveyor PushArtifact mpv-debug.7z

7z a mpv.7z ./mpv-x86_64*/*
appveyor PushArtifact mpv.7z
