#### Basic settings start ####

# インクリメンタルサーチ(Ctrl+s)が効くようにする
stty stop undef

# Prompt
PROMPT='%c %# '

#### Basic settings end ####

#### Path settings start ####

# PATH
export PATH="$HOME/.local/bin:$PATH"

# CDPATH
CDPATH=".:$HOME/workspace"
for dir in $HOME/workspace/*/; do
  CDPATH="$CDPATH:${dir%/}"
done
export CDPATH

#### Path settings end ####

#### Alias settings start ####

# ls
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -aG'

# Move directory
alias pd='pushd > /dev/null'
alias po='popd > /dev/null'
alias dr='dirs -v'

# nvim
if command -v nvim &> /dev/null; then
  alias vi='nvim'
  alias vim='nvim'
fi

# python
function venv() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -d "$dir/.venv" ]]; then
      echo "activated: $dir/.venv"
      source "$dir/.venv/bin/activate"
      return
    fi
    dir="$(dirname "$dir")"
  done
  echo ".venv not found"
  return 1
}

# tree
if command -v tree &> /dev/null; then
  alias tree='tree -C -L 2 --dirsfirst'
fi

# claude code
if command -v claude &> /dev/null; then
  alias cl='claude'
fi

#### Alias settings end ####




#### Completion settings start ####

# zsh command completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# completeコマンドの有効化
autoload -Uz bashcompinit && bashcompinit

# AWS CLIのコマンド補完の有効化
command -v aws_completer &>/dev/null && complete -C aws_completer aws

#### Completion settings end ####


#### Other settings start ####

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

#### Other settings end ####
