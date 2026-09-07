DEB="$(find "$HOME/build/nnk-spnego" -maxdepth 2 -type f \
  -name 'libnginx-mod-http-auth-spnego_*_*.deb' \
  -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2-)"

echo "DEB: $DEB"
dpkg-deb --info "$DEB"
dpkg-deb --contents "$DEB"nn
