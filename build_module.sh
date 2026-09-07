set -euo pipefail

# Установка инструментов для сборки
sudo apt update
sudo apt install \
  apt-src build-essential devscripts dpkg-dev fakeroot \
  debhelper ca-certificates lintian

# Подготовка директории
BUILD_ROOT="$HOME/build/nnk-spnego"
mkdir -p "$BUILD_ROOT/logs"
cd "$BUILD_ROOT"

# Получение исходников
sudo apt-src update
sudo apt-src --location="$BUILD_ROOT" install libnginx-mod-http-auth-spnego

# Проверка версий исходников
SRC_DIR="$(apt-src --location="$BUILD_ROOT" location libnginx-mod-http-auth-spnego)"
cd "$SRC_DIR"
dpkg-parsechangelog -S Source
dpkg-parsechangelog -S Version

# Сборка пакета
cd "$BUILD_ROOT"
DEB_BUILD_OPTIONS="parallel=$(nproc)" \
  apt-src --location="$BUILD_ROOT" build libnginx-mod-http-auth-spnego \
  2>&1 | tee logs/build.log

# Проверка полученного .deb пакета
DEB="$(find "$BUILD_ROOT" -maxdepth 2 -type f \
  -name 'libnginx-mod-http-auth-spnego_*_*.deb' \
  -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2-)"

dpkg-deb --info "$DEB"
dpkg-deb --contents "$DEB"
lintian "$DEB" | tee logs/lintian.log || true
sha256sum "$DEB" | tee "${DEB}.sha256"
