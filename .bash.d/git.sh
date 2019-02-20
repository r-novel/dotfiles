alias git-config='vim $HOME/.gitconfig'

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function git-acp() {
  local b=`git rev-parse --abbrev-ref HEAD`
  if [ -z $b ]; then
    printf "\033[1;32m[i]: branch not found. move to local repository.\033[0m\n"
    return
  fi

  local kind=`echo $b | cut -d'/' -f 1 | cut -c 1- `
  if [ $kind == "feature" ]; then
    printf "\033[1;32m[i]: it is feature branch: add, commit, push!\033[0m\n"
    local msg="refs `echo $b | cut -d'/' -f 3`; $1;"
    git add . && git commit -m "$msg" && git push origin $b
    return
  fi

  printf "\033[1;32m[w]: something wrong; check correct branch name;\033[0m\n"
  return
}
