#!/bin/bash
source ./install-deps.sh

DOTFILES=$HOME/dotfiles

# Create symlinks for dotfiles
create_link() {
  if [ -e "$2" ]; then
    rm -rf $2
  fi

  ln -s $1 $2
  echo "Created symlink from $1 to $2"
}

bootstrap() {
  cd ..

  echo "Installing dotfiles..."

  find -H "$DOTFILES" -maxdepth 2 -name "link.prop" -not -path "*.git*" | while read linkfile; do
    cat "$linkfile" | while read line; do
      local src dst dir
      src=$(eval echo "$line" | cut -d '=' -f 1)
      dst=$(eval echo "$line" | cut -d '=' -f 2)
      dir=$(dirname $dst)

      mkdir -p "$dir"
      create_link "$src" "$dst"
    done
  done

  echo ""
  echo ""
  echo "Installation complete!"
  exec zsh -l
}

bootstrap
