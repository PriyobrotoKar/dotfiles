# Environment Variables
export DOTFILES=$HOME/dotfiles
export NVM_DIR="$HOME/.nvm"
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export ANDROID_HOME=/Users/priyobroto/Library/Android/sdk
export PNPM_HOME="/Users/priyobroto/Library/pnpm"

# Add paths to PATH
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
# pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

plugins=(git)
ZSH_THEME="robbyrussell"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load configuration files
source $DOTFILES/zsh/aliases.zsh
source ~/.config/tmux/.tmux-alias
source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

