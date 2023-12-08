#!/bin/sh

cat <<EOF
******************************
*  ____  _     _   _         *
* / ___|| |__ | |_| |_ _ __  *
* \___ \| '_ \| __| __| '__| *
*  ___) | | | | |_| |_| |    *
* |____/|_| |_|\__|\__|_|    *
*                            *
******************************                          

EOF

if [ "$(id -u)" -ne 0 ]; then
  echo "Must be root in install with install.sh!"
  exit 1
fi

echo "Preparing for installation..."
mkdir -p /usr/local/bin
mkdir -p /usr/local/share/shttr-cli

echo "Downloading Shttr CLI..."
wget "https://raw.githubusercontent.com/calebstein1/shttr-cli/main/shttr"
wget "https://raw.githubusercontent.com/calebstein1/shttr-cli/main/shttr-dbg"
wget "https://raw.githubusercontent.com/calebstein1/shttr-cli/main/shttr-systemd"

echo "Installing Shttr CLI..."
mv shttr /usr/local/bin
mv shttr-dbg /usr/local/bin
mv shttr-systemd /usr/local/share/shttr-cli
chmod +x /usr/local/bin/shttr
chmod +x /usr/local/bin/shttr-dbg

echo "Shttr CLI installed successfully!"
