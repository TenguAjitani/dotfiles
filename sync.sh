#!/bin/bash

dst_dir=~/.git/dotfiles

mkdir -p "$dst_dir"

files=(
  ~/.config/hypr
  ~/.config/ghostty
  ~/.config/quickshell
  ~/.config/rofi
  ~/Pictures
  ~/.zshrc
)

sync_files() {
  for file in "${files[@]}"; do
    if [[ "$file" == "$HOME/Pictures" ]]; then
      rsync -av --exclude="screenshot" "$file/" "$dst_dir/Pictures"
    elif [[ "$file" == $HOME/.config/* ]]; then
      rsync -av "$file" "$dst_dir/.config/"
    else
      rsync -av "$file" "$dst_dir/"
    fi
  done

  echo "going to dotfiles..."

  sleep 1

  cd "$dst_dir"

  echo "performing git shits..."

  git add .

  git commit -m "Sync files"
}

# Sync files
sync_files
echo "your shit is ready to be PUSH PUSH PUSH... ...ed"
