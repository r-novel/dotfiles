alias sublime-start='subl'

function sublime-open-dir() {
  if [ $1 != "" ]; then
     subl $1
   else
     subl $PWD
  fi
}   
