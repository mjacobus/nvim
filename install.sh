#!/usr/bin/env bash
#!/usr/bin/env bash
set -e

target_dir="$HOME/.config/mjvim"
src_dir="$(cd "$(dirname "$0")" && pwd)"
timestamp="$(date +%Y%m%d-%H%M%S)"

backup_existing() {
  if [ -L "$target_dir" ]; then
    current_target="$(readlink "$target_dir")"
    if [ "$current_target" != "$src_dir" ]; then
      echo "Backing up existing symlink at $target_dir"
      mv "$target_dir" "${target_dir}.bak-$timestamp"
    else
      echo "$target_dir already points to $src_dir — nothing to do."
      exit 0
    fi
  elif [ -e "$target_dir" ]; then
    echo "Backing up existing directory or file at $target_dir"
    mv "$target_dir" "${target_dir}.bak-$timestamp"
  fi
}

echo "Installing mjvim config..."
backup_existing

ln -sfn "$src_dir" "$target_dir"
echo "Linked $src_dir → $target_dir"

echo "Installed. Don't forget the alias"
echo "Create alias: alias mjvim='NVIM_APPNAME=.mjvim nvim'"
