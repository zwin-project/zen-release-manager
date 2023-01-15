#! /bin/sh

execute() {
  echo "*** $*"
  eval "$*"
  ret=$?
  if [ $ret != 0 ]; then
    echo ""
    echo "==========================="
    echo "          failure"
    echo "==========================="
    echo ""
    exit 1
  fi
}

sync_repository() {
  if [ "$CONFIGURED" != 1 ]; then
    echo "Build direcitory is not configured yet"
    exit 1
  fi

  repo="$1"
  dir="$2" # must be abs path
  revision="$3"
  if [ ! -d "$dir" ]; then
    execute git clone "$repo" "$dir" --recursive
  fi
  execute cd "$dir"
  execute git fetch
  execute git checkout "$revision"
  execute git submodule update --init --recursive
}

export BUILD_DIR="$PROJECT_ROOT/build"

export ZWIN_DIR="${BUILD_DIR}/zwin"
export GRPC_DEV_DIR="${BUILD_DIR}/grpc-dev"
export ZEN_DIR="${BUILD_DIR}/zen"
export ZENNIST_DIR="${BUILD_DIR}/zennist"
export ZEN_OBJECT_VIEWER_DIR="${BUILD_DIR}/zen-object-viewer"
export ZEN_REMOTE_DIR="${BUILD_DIR}/zen-remote"
export ZUKOU_DIR="${BUILD_DIR}/zukou"
export ZEN_MIRROR_DIR="${BUILD_DIR}/zen-mirror"

export CC=clang
export CXX=clang++

if [ -e "$BUILD_DIR/config" ];then
  execute . "$BUILD_DIR/config"
fi

