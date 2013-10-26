# ターミナルのユーザ名表示
PS1='\W$ '

# alias
alias ll='ls -l'
alias la='ls -la'
alias ls='ls -G'
alias chromedev='open -a Google\ Chrome --args --allow-file-access-from-files'

if [ -f ~/.bash_local ] ; then
	source ~/.bash_local
fi


# rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/shims:$PATH"
