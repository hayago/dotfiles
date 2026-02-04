# homebrew
[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# rbenv
command -v rbenv &>/dev/null && eval "$(rbenv init - --no-rehash zsh)"
