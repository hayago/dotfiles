# ターミナルのユーザ名表示
PS1='\W$ '

# alias
alias ll='ls -l'
alias la='ls -la'
alias ls='ls -G'

if [ -f ~/.bash_local ] ; then
	source ~/.bash_local
fi
