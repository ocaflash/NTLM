cat /etc/os-release
dpkg-query -W -f='${Package}\t${Version}\t${Architecture}\n' \
  nginx nginx-common nginx-core nginx-full nginx-extras 2>/dev/null || true
apt-cache policy nginx nginx-common nginx-core nginx-full nginx-extras
nginx -V 2>&1
