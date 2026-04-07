#!/bin/bash

dst_dir=~/.gitfiles/dotfiles
mkdir -p "$dst_dir"

files=(
  ~/.config/hypr
  ~/.config/ghostty
  ~/.config/quickshell
  ~/.config/rofi
  ~/Pictures/swwwWallpapers
  ~/Pictures/Wallpapers
  ~/.zshrc
)

sync_files() {
  local filepath="$1"
  local relative="${filepath#$HOME/}" #removes home directory prefix
  local dst="$dst_dir/$relative"

  if [ ! -L "$filepath" ]; then
    mkdir -p "$(dirname "$dst")"
    mv "$filepath" "$dst"
    ln -s "$dst" "$filepath"
    echo "Linked: $relative"
  else
    echo "Skip linking: $filename is already a symlink."
  fi
}

# Sync files
for filepath in "${files[@]}"; do
  sync_files "$filepath"
done

echo "going to dotfile folder"

cd ~/.gitfiles/dotfiles/
git add .
git commit -m "Sync Files"
echo "your shit is ready to be PUSH PUSH PUSH... ...ed"
