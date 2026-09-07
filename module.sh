sudo apt update
sudo apt-cache showsrc libnginx-mod-http-auth-spnego | grep -E '^(Package|Version|Build-Depends):'

sudo apt install \
  apt-src \
  build-essential \
  devscripts \
  dpkg-dev \
  fakeroot \
  debhelper \
  ca-certificates \
  lintian

sudo apt-src --version 2>/dev/null || apt-src --help | head
sudo apt-cache policy nginx-dev dh-sequence-nginx libkrb5-dev

sudo dpkg-query -W -f='${Package}=${Version}\n' nginx nginx-common 2>/dev/null
sudo nginx -V 2>&1
sudo uname -m
sudo dpkg --print-architecture
