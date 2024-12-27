source_aliases(){
  find "$DOTFILES" -type f -name "*.alias" | while read alias_file; do
    source "$alias_file"
  done
}


source_aliases

