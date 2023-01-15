#! /bin/sh

. tools/common.sh

if [ "$MODULE_PROTOCOL" = "1" ]; then
  sync_repository "$ZWIN_REPOSITORY" "$ZWIN_DIR" "$ZWIN_REVISION"

  execute cd "$ZWIN_DIR"
  execute meson build
  execute ninja -C build install
fi

if [ "$MODULE_DEPS" = "1" ]; then
  execute cd "$ZEN_REMOTE_DIR" && mkdir -p build
  execute cmake --install build

  execute cd "$ZUKOU_DIR"
  execute ninja -C build install
fi

if [ "$MODULE_DESKTOP" = "1" ]; then
  execute cd "$ZENNIST_DIR"
  execute meson build
  execute ninja -C build install

  execute cd "$ZEN_DIR"
  execute meson build
  execute ninja -C build install

  execute cd "$ZEN_OBJECT_VIEWER_DIR"
  execute meson build
  execute ninja -C build install
fi

