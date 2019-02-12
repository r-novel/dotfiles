alias git-config='vim $HOME/.gitconfig'

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function git-acp() {
  local base=`echo $(parse_git_branch) | cut -d'/' -f 2 | cut -c 2- | rev | cut -c 2- | rev` 
  if [ -z $(parse_git_branch) ]; then
    printf "\033[1;32m[i]: branch not found. move to local repository.\033[0m\n"
    return
  else if [ "$base" = "master" ]; then
    printf "\033[01;38;05;214m[w]: it is master branch; auto checkout on default feature branch...\033[0m\n"
    git checkout -b "feature/master/#0"
    printf "\033[1;32m[i]: default feature branch has been created.\033[0m\n"
    fi
  fi
  
  local branch=`echo $(parse_git_branch) | cut -c 2- | rev | cut -c 2- | rev`

  local kind=`echo $(parse_git_branch) | cut -d'/' -f 1 | cut -c 2- `  
  if [ $kind = "release" ]; then
    printf "\033[01;38;05;214m[w]: it is release branch; please checkout on feature branch.\033[0m\n"
    version=`echo $(parse_git_branch) | cut -d'/' -f 2 | rev | cut -c 2- | rev`
    echo $version
    return
  fi

  local number=`echo $(parse_git_branch) | cut -d'/' -f 3 | rev | cut -c 2- | rev`
 
  if [ -z $number ]; then
    printf "\033[01;38;05;214m[w]: number of ticket not found;\033[0m\n"
    number=`echo '#0'`
  fi 
  
  local msg="refs $number; $1;"
  git add . && git commit -m "$msg" && git push origin $branch
  printf "\033[1;32m[i]: changes sent to remote successfully!\033[m\n"
}
