#! /bin/sh

. tools/common.sh

if [ -e "$ZWIN_DIR/build" ]; then
  execute cd "$ZWIN_DIR"
  execute ninja -C build uninstall
fi

if [ -e "$ZEN_DIR/build" ]; then
  execute cd "$ZEN_DIR"
  execute ninja -C build uninstall
fi

if [ -e "$ZENNIST_DIR/build" ]; then
  execute cd "$ZENNIST_DIR"
  execute ninja -C build uninstall
fi

if [ -e "$ZEN_REMOTE_DIR/build/install_manifest.txt" ]; then
  execute cd "$ZEN_REMOTE_DIR"
  execute xargs rm -f < $ZEN_REMOTE_DIR/build/install_manifest.txt
fi

if [ -e "$ZUKOU_DIR/build" ]; then
  execute cd "$ZUKOU_DIR"
  execute ninja -C build uninstall
fi

