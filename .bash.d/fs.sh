# file system;

PROG_DIR=$HOME/Documents/programming

alias .='ls -lah --color ./'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias mkdir='mkdir -p'
alias cp-dir='cp -r'

alias ls='ls --color --group-directories-first -p -CF'
alias ll='ls -lah --color --group-directories-first'

alias rmrf='rm -rf'

# configs;
alias bash-config='vim $HOME/.bashrc'
alias reload-bashrc='source $HOME/.bashrc'

alias ssh-config='vim $HOME/.ssh/config'

# development;
alias to-project='cd $PROG_DIR/projects'
alias to-sandbox='cd $PROG_DIR/sandbox'
alias to-icebox='cd $PROG_DIR/icebox'
alias to-home='cd $HOME'
