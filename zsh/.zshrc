# Alias
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -aG'

# ディレクトリ移動のためのエイリアス
alias pd='pushd > /dev/null'
alias po='popd > /dev/null'
alias d='dirs -v'

# nvim alias
if command -v nvim &> /dev/null; then
  alias v='nvim'
  alias vi='nvim'
  alias vim='nvim'
fi

# alias(python)
alias venv='source .venv/bin/activate'

# alias(tree)
if command -v tree &> /dev/null; then
  alias t='tree -C -L 2 --dirsfirst'
fi

# CDPATH
CDPATH="."
for dir in $HOME/workspace/*/; do
  CDPATH="$CDPATH:${dir%/}"
done
export CDPATH

# インクリメンタルサーチ(Ctrl+s)が効くようにする
stty stop undef

# Prompt
PROMPT='%c %# '

# zsh command completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# PATH
export PATH="$HOME/.local/bin:$PATH"

# nvm (Node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Golang
command -v go &>/dev/null && export PATH="$PATH:$(go env GOPATH)/bin"

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# LM Studio CLI (lms)
export PATH="$PATH:~/.lmstudio/bin"

