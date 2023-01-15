#! /bin/sh

. tools/common.sh

if [ "$MODULE_PROTOCOL" = "1" ]; then
  sync_repository "$ZWIN_REPOSITORY" "$ZWIN_DIR" "$ZWIN_REVISION"

  execute cd "$ZWIN_DIR"
  execute meson build
  execute ninja -C build
fi

if [ "$MODULE_DEPS" = "1" ]; then
  sync_repository "$GRPC_DEV_REPOSITORY" "$GRPC_DEV_DIR" "$GRPC_DEV_REVISION"

  execute cd "$GRPC_DEV_DIR"
  execute touch "local.mk"
  execute make native

  sync_repository "$ZEN_REMOTE_REPOSITORY" "$ZEN_REMOTE_DIR" "$ZEN_REMOTE_REVISION"

  execute cd "$ZEN_REMOTE_DIR" && mkdir -p build
  execute cmake -DZEN_REMOTE_GRPC_SYSROOT="$GRPC_DEV_DIR/native/Debug" -B build -G Ninja
  execute cmake --build build

  sync_repository "$ZUKOU_REPOSITORY" "$ZUKOU_DIR" "$ZUKOU_REVISION"
  execute cd "$ZUKOU_DIR"
  execute meson build
  execute ninja -C build
fi

if [ "$MODULE_DESKTOP" = "1" ]; then
  sync_repository "$ZENNIST_REPOSITORY" "$ZENNIST_DIR" "$ZENNIST_REVISION"

  execute cd "$ZENNIST_DIR"
  execute meson build
  execute ninja -C build

  sync_repository "$ZEN_REPOSITORY" "$ZEN_DIR" "$ZEN_REVISION"

  execute cd "$ZEN_DIR"
  execute meson build -Dtests=false
  execute ninja -C build

  sync_repository "$ZEN_OBJECT_VIEWER_REPOSITORY" "$ZEN_OBJECT_VIEWER_DIR" "$ZEN_OBJECT_VIEWER_REVISION"

  execute cd "$ZEN_OBJECT_VIEWER_DIR"
  execute meson build
  execute ninja -C build
fi

