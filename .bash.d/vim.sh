# config;
alias vim-config='vim $HOME/.vimrc'
alias reload-vimrc='source $HOME/.vimrc'

# vim .dir;
alias to-dotvim='cd $HOME/.vim'

# open vim Go IDE;
alias vimgo='vim -u ~/.vimrc.go'

function vim-help() {
	printf "\033[4;49;32m USAGE:\033[0m\n"
	printf "\033[38;5;39m\033[0m\033[5;49;36m:line_num1,line_num2t.<enter>\033[0m \t\t/* copy the current lines to your present cursor location; */\n"
}
