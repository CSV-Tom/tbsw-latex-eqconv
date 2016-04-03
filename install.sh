#!/bin/sh

INSTALL_DIR="/opt/tbsw/scripts/latex-eqconv"
INSTALL_BIN="${INSTALL_DIR}/bin/"

sudo mkdir -p "$INSTALL_DIR"
sudo mkdir -p "$INSTALL_BIN"

sudo cp convert.sh "$INSTALL_DIR"
sudo cp -r templates "$INSTALL_DIR"
sudo cp -r formulas "$INSTALL_DIR"
sudo cp -r scripts "$INSTALL_DIR"

sudo unlink "${INSTALL_BIN}/tbsw-texeqconv"

sudo ln -s "$INSTALL_DIR/convert.sh" "${INSTALL_BIN}/tbsw-texeqconv" 

sudo sh -c "echo 'export PATH=${INSTALL_BIN}:\$PATH' > /etc/profile.d/tbsw-tex-eqconv-scripts.sh"
