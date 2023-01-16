#! /bin/sh

. tools/common.sh

failure() {
  echo ""
  echo "==========================="
  echo "          failure"
  echo "==========================="
  echo ""
  exit 1
}

if [ "$MODULE_ZEN_MIRROR" = "1" ]; then

  execute mkdir -p "$ZEN_MIRROR_DIR"
  execute cd "$ZEN_MIRROR_DIR"

  execute wget "$ZEN_MIRROR_URL" -O zen-mirror.apk

  echo "*** echo \$ZEN_MIRROR_SHA256 > zen-mirror-sha256"
  echo "$ZEN_MIRROR_SHA256  zen-mirror.apk" > zen-mirror-sha256

  if [ "$?" != 0 ]; then
    failure
  fi

  echo "*** shasum -a 256 -c zen-mirror-sha256"
  cat ./zen-mirror.apk | shasum -a 256 -c zen-mirror-sha256 

  if [ "$?" != 0 ]; then
    failure
  fi
fi
