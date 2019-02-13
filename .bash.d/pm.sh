# brew
alias b-install='brew install'
alias b-upgrade='brew upgrade'
alias b-list='brew list'
alias b-info='brew info'
alias b-clean='brew cleanup'
alias b-cat='brew cat'
alias b-home='brew home'
alias b-upd='brew update'

function brew-help() {
	printf "\033[4;49;32m USAGE:\033[0m\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mb-intsall\033[0m \t/* install a package; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mb-upgrade\033[0m \t/* upgrade a package; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mb-list\033[0m \t/* list installed; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mb-info\033[0m \t/* list versions, caveats, etc; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mb-clean\033[0m \t/* remove old versions; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mb-cat\033[0m \t/* print this formula; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mb-home\033[0m \t/* open homepage; */\n"	
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mb-upd\033[0m \t/* update brew and cask; */\n"
}
