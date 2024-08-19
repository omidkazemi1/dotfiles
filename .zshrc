zstyle :compinstall filename '/home/omid/.zshrc'

# alias
alias q="python ./q"
alias zshconf="vim ~/.zshrc"
alias ls='lsd -l'


source /home/omid/.config/broot/launcher/bash/br
eval "$(starship init zsh)"

# install zinit (plugin loader for zsh)
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"


# completions
fpath+=/home/omid/Documents/repositories/quera/.quera/completion
autoload -Uz compinit && compinit
zinit cdreplay -q


# pluigins

## fzf-tab
zinit light Aloxaf/fzf-tab

## zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

## zsh-completions
zinit light zsh-users/zsh-completions

## zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions

## atuin
zinit light atuinsh/atuin

zinit snippet OMZP::command-not-found
zinit snippet OMZP::sudo


# options
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

## make autocompletions case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
## make them colorful
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

## make them use fzf
zstyle ':completion:*' menu no

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

## show directory when cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

