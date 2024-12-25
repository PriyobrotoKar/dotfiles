source_aliases(){
  find "$DOTFILES" -type f -name "*.alias" | while read alias_file; do
    echo "Sourcing: $alias_file"
    source "$alias_file"
  done
}

echo "Sourcing aliases..."

source_aliases

echo "Done"
