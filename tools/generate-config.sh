#! /bin/sh

find_command_from_path() {
  path=$(command -v "$1")
  [ -z "$path" ] && exit
  echo "$path" | grep "alias" && exit
  echo "$path"
}

cat << END
[wallpaper]
filepath = "/usr/local/share/backgrounds/zen/Zen_Wallpaper_Main_3840x2160.png"

[board]
initial_count = 3

[space]
default_app = "zennist"

END

path=$(find_command_from_path google-chrome-stable)
if [ -s "$path" ]; then
  cat << END
[[favorite_apps]]
name = "Google Chrome"
exec = "google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland --disable-gpu"
icon = "/usr/share/icons/hicolor/128x128/apps/google-chrome.png"

END
fi

path=$(find_command_from_path weston-terminal)
if [ -s "$path" ]; then
  cat << END
[[favorite_apps]]
name="Weston Terminal"
exec="weston-terminal"
icon="/usr/share/weston/terminal.png"

END
fi

path=$(find_command_from_path nautilus)
if [ -s "$path" ]; then
  cat << END
[[favorite_apps]]
name="Nautilus"
exec="nautilus"
icon="/usr/share/icons/hicolor/scalable/apps/org.gnome.Nautilus.svg"

END
fi

path=$(find_command_from_path zen-object-viewer)
if [ -s "$path" ]; then
  cat << END
[[favorite_apps]]
name="Zen Object Viewer"
exec="zen-object-viewer"
icon="/usr/local/share/zen-object-viewer/assets/icon/3d_viewer_icon.gltf"
disable_2d=true

END
fi
