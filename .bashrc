export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export EDITOR='subl -w'

alias bash-config='vim $HOME/.bashrc'
alias reload-bashrc='source $HOME/.bashrc'

if [ -d $HOME/.bash.d ]; then
	for f in $HOME/.bash.d/*.sh; do
		if [ -r $f ]; then
			source $f
		fi
	done
	unset f
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PS1="\[\033[5;49;91m\][☭]\[\033[0m\]\[\033[38;5;113m\]\u\[\033[38;5;39m\]@\[\033[32m\]\h:\[\033[38;5;39m\]\w\[\033[0m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
