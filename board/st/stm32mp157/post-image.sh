#!/bin/bash
set -e
BOARD_DIR="$(dirname $0)"
cp $BOARD_DIR/overlay/boot/* -rfd ${BINARIES_DIR}
cp $BOARD_DIR/overlay/Ram  -rfd ${BINARIES_DIR}
cp $BOARD_DIR/overlay/emmc_systemall.tsv  -rfd ${BINARIES_DIR}
cp $BOARD_DIR/overlay/sdcard_systemall.tsv    -rfd ${BINARIES_DIR}

exit $?
