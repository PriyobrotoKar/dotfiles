export DOTFILES=$HOME/dotfiles
export ZSH="$HOME/.oh-my-zsh"

#oh-my-zsh
plugins=(git)
ZSH_THEME="robbyrussell"

# Load configuration files
source $ZSH/oh-my-zsh.sh
source $DOTFILES/zsh/aliases.zsh
source ~/.config/tmux/.tmux-alias
source <(fzf --zsh)


# Environment Variables
export NVM_DIR="$HOME/.nvm"
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


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


