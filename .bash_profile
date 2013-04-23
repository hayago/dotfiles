# alias
alias ll='ls -l'
alias la='ls -la'
alias ls='ls -G'
alias lt='ls -t'
alias v='vim'
alias sv='sudo vim'

if [ -f ~/.bash_local ] ; then
	source ~/.bash_local
fi
