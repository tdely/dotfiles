export PATH="$HOME/.local/bin:/usr/local/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin:$HOME/.nimble/bin"
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sunrise"

DISABLE_AUTO_UPDATE="false"
DISABLE_UPDATE_PROMPT="true"

export UPDATE_ZSH_DAYS=30

# Display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(cp git nmap sudo systemadmin vscode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

source $HOME/zsh-hist/zsh-hist.plugin.zsh
source $HOME/.aliases
