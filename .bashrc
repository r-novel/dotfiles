export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export EDITOR='subl -w'

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PS1="\[\033[5;49;91m\][☭]\[\033[0m\]\[\033[38;5;113m\]\u\[\033[38;5;39m\]@\[\033[32m\]\h:\[\033[38;5;39m\]\w\[\033[0m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias bash-config='vim $HOME/.bashrc'
alias vim-config='vim $HOME/.vimrc'
alias tmux-config='vim $HOME/.tmux.conf'

function git-exec() {
  local base=`echo $(parse_git_branch) | cut -d'/' -f 2 | cut -c 2- | rev | cut -c 2- | rev` 
  
  if [ -z $(parse_git_branch) ]; then
    echo '[i]: branch not found. move to local repository.'
    return
  else if [ "$base" = "master" ]; then
    echo '[w]: it is master branch; auto checkout on default feature branch...'
    git checkout -b "feature/master/#0"
    echo '[i]: default feature branch has been created.'
    fi
  fi
  
  local kind=`echo $(parse_git_branch) | cut -d'/' -f 1 | cut -c 2- `  
  echo $kind

  if [ $kind = "release" ]; then
    echo '[w]: it is release branch; please checkout on feature branch.'
    return
  fi
  
  local branch=`echo $(parse_git_branch) | cut -c 2- | rev | cut -c 2- | rev`
  echo $branch
  
  local number=`echo $(parse_git_branch) | cut -d'/' -f 3 | rev | cut -c 2- | rev`
  echo $number
 
  if [ -z $number ]; then
    echo 'number of issue not found;'
    number=`echo '#0'`
  fi 
  
  local refs="refs $number;"
  local msg="$refs $1;"
  
  local message=`echo $msg`

  git add . && git commit -m "'$msg'" && git push origin $branch
}

function tmux-help() {
	printf "\033[4;49;32m USAGE:\033[0m\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mtmux\033[0m \t\t\t\t/* start new; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mtmux new -s session-name\033[0m \t\t/* start new session with name; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mtmux a\033[0m \t\t\t\t/* attach; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mtmux a -t session-name\033[0m \t\t/* attach to named session; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mtmux ls\033[0m \t\t\t\t/* list sessions; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36mtmux kill-session -t session-name\033[0m \t/* kill named session; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> s\033[0m \t\t\t\t/* list sessions; */\n"	
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> $\033[0m \t\t\t\t/* name session; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> c\033[0m \t\t\t\t/* new tab; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> ,\033[0m \t\t\t\t/* name tab; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> w\033[0m \t\t\t\t/* list of tabs; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> f\033[0m \t\t\t\t/* find tab; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> &\033[0m \t\t\t\t/* kill tab; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> .\033[0m \t\t\t\t/* move tab - prompted for a new number; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> %%\033[0m \t\t\t\t/* horizontal pane split; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> \"\033[0m \t\t\t\t/* vertical pane split; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> o\033[0m \t\t\t\t/* switch between panes; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> q\033[0m \t\t\t\t/* show pane numbers; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> x\033[0m \t\t\t\t/* kill pane; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> space\033[0m \t\t\t/* toggle between layouts; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> d\033[0m \t\t\t\t/* detach; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> t\033[0m \t\t\t\t/* big clock; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> ?\033[0m \t\t\t\t/* list shortcuts; */\n"
	printf "\033[38;5;39m:~\033[0m $ \033[5;49;36m<C-a> :\033[0m \t\t\t\t/* prompt; */\n"
	
}

PROG_DIR=$HOME/Documents/programming
alias to-dotvim='cd $HOME/.vim'
alias to-project='cd $PROG_DIR/projects'
alias to-sandbox='cd $PROG_DIR/sandbox'
alias to-icebox='cd $PROG_DIR/icebox'
alias to-home='cd $HOME'
alias .='ls -lah ./'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -p'

alias reload-bashrc='source $HOME/.bashrc'
alias reload-vimrc='source $HOME/.vimrc'
alias gcc7='gcc-mp-7'
alias g++7='g++-mp-7'
alias go='/usr/local/go/bin/go'
alias vimgo='vim -u ~/.vimrc.go'
alias pub-ip='curl ifconfig.co'

alias sublime-start='subl'

function sublime-open-dir() {
  if [ $1 != "" ]; then
     subl $1
   else
     subl $PWD
  fi
}   

