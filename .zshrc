export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export ZSH_CACHE_DIR="$XDG_STATE_HOME/zsh/cache"
export ZSH="$XDG_DATA_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export MANPAGER='nvim +Man!'

path+=("/usr/local/sbin")
path=("$HOME/.local/bin" $path)
path=("$HOME/.nimble/bin" $path)
export PATH

if [ -z "$LS_COLORS" ]; then
    if (( $+commands[dircolors] )); then
        source <(dircolors -b "$XDG_CONFIG_HOME/dircolors")
    fi
fi
autoload -U colors
colors

setopt hist_ignore_space
setopt no_case_glob
setopt hist_no_store
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt prompt_subst
unsetopt menu_complete
setopt auto_menu
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}// %d%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}// %d (errors: %e)%f'
zstyle ':completion:*:*:*:*:warnings' format '%F{red}// no matches found%f'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Green for any option descriptions
zstyle ':completion:*:options' list-colors '=(#b)*(-- *)=0=32' '=*=0'
# Red for kill process names
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;31=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' group-name ''
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

DISABLE_UNTRACKED_FILES_DIRTY="true"
source "$XDG_CONFIG_HOME/zsh/sunrise"

HIST_STAMPS="yyyy-mm-dd"

autoload -U compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$HOST"

export EDITOR='nvim'

source $HOME/.aliases

# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $ZSH/fast-syntax-highlighting
source $ZSH/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# git clone https://github.com/marlonrichert/zsh-hist $ZSH/zsh-hist
source $ZSH/zsh-hist/zsh-hist.plugin.zsh
# Install from package manager
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# emacs mode, vi mode too broken:
# insert, del, home, end didn't work right in normal mode, part of command
# couldn't be backspaced after some series of actions was done..
bindkey -e
#export KEYTIMEOUT=1

# [Home] - Go to beginning of line
if [ -n "${terminfo[khome]}" ]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  bindkey -M viins "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
# [End] - Go to end of line
if [ -n "${terminfo[kend]}" ]; then
  bindkey -M emacs "${terminfo[kend]}"  end-of-line
  bindkey -M viins "${terminfo[kend]}"  end-of-line
  bindkey -M vicmd "${terminfo[kend]}"  end-of-line
fi
# [Shift-Tab] - move through the completion menu backwards
if [ -n "${terminfo[kcbt]}" ]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

bindkey '^[[3~' delete-char

# Alt-
bindkey "^[m" copy-prev-shell-word
bindkey -M viins -s '^[i' " tcht.sh\n"
bindkey -M emacs -s '^[i' " tcht.sh\n"
# Ctrl-
bindkey -M viins -s ^f " tsesh\n"
bindkey -M emacs -s ^f " tsesh\n"
# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word
# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

function tomb () {
  case $1 in
    open)
      sudo /usr/bin/mkdir -m 0755 /run/media
      sudo tomb $@
      ;;
    close|slam)
      sudo tomb $@
      ;;
    *)
      tomb $@
      ;;
  esac
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp" >/dev/null
}
