#! /bin/sh

. tools/common.sh

execute rm -rf "$ZWIN_DIR"
# Rebuilding grpc_dev is too costy
# execute rm -rf "$grpc_dev_dir"
execute rm -rf "$ZEN_DIR"
execute rm -rf "$ZENNIST_DIR"
execute rm -rf "$ZEN_OBJECT_VIEWER_DIR"
execute rm -rf "$ZEN_REMOTE_DIR"
execute rm -rf "$ZUKOU_DIR"
