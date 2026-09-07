echo 'deb-src http://deb.debian.org/debian trixie main' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian trixie-updates main' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian-security trixie-security main' | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt-cache showsrc libnginx-mod-http-auth-spnego | grep -E '^(Package|Version|Build-Depends):'
