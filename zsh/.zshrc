# Homebrew PATH for Apple Silicon Mac
export PATH="/opt/homebrew/bin:$PATH"

# Basic zsh settings
export LANG=en_US.UTF-8
export EDITOR=vim

# History settings
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Enable completion
autoload -U compinit
compinit

# Aliases
alias ll='ls -la'
alias la='ls -la'
alias ..='cd ..'
alias ...='cd ../..'

# If you have exa/eza installed later
# alias ls='exa'
# alias ll='exa -la'
