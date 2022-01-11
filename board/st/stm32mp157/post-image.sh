#!/bin/bash
set -e
BOARD_DIR="$(dirname $0)"
cp $BOARD_DIR/overlay/boot/* -rfd ${BINARIES_DIR}

exit $?
