#!/bin/bash
source ./install-deps.sh

DOTFILES=$HOME/dotfiles

# Create symlinks for dotfiles
create_link() {
  if [ -f "$2" ]; then
    echo "File $2 already exists"
  else
    ln -s $1 $2
    echo "Created symlink from $1 to $2"
  fi
}

bootstrap() {
  cd ..

  echo "Installing dotfiles..."

  find . -name "link.prop" -not -path "*.git*" | while read linkfile; do
    cat "$linkfile" | while read linkfile; do
      local src dst dir
      src=$(eval echo "$line" | cut -d '=' -f 1)
      dst=$(eval echo "$line" | cut -d '=' -f 2)
      dir=$(dirname $dst)

      mkdir -p "$dir"
      create_link "$src" "$dst"
    done
  done
}

bootstrap
echo ""
echo ""
echo "Installation complete!"
