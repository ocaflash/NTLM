grep -RhsE '^(deb-src|Types:.*deb-src)' /etc/apt/sources.list /etc/apt/sources.list.d 2>/dev/null
sudo apt-cache showsrc libnginx-mod-http-auth-spnego | grep -E '^(Package|Version|Build-Depends):'
