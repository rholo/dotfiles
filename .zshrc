# Historial
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt append_history
setopt share_history

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# export GEMINI_API_KEY=

ZSH_THEME="robbyrussell"

plugins=(git zsh-completions zsh-autosuggestions)

unsetopt correct

source $ZSH/oh-my-zsh.sh

export GITLAB=~/workspace/gitlab
alias home="~/"
alias vim="nvim"

alias workspace="~/workspace"
alias gitlab="cd $GITLAB"

alias ll="eza -la --icons -l -G"
alias lt="eza -la --tree --level=2 --icons"
alias ls="eza -la -1 --icons -G --classify"

alias open-repo='open "$(git remote get-url origin | sed -E '\''s/git@([^:]+):([^/]+)\/(.*)\.git/https:\/\/\1\/\2\/\3/'\'' | sed '\''s/\.git$//'\'')"'

# bindkey '^[[[CE' autosuggest-execute
bindkey '^E' autosuggest-execute
bindkey '^A' autosuggest-accept

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
