#!/bin/sh
function ergodic(){
  for fullname in `ls $1`
  do
	{ name=${fullname%.*}
    ext=${fullname##*.}
    if [ "$ext" = "md" ]
    then
      echo $name
	pandoc $name.md -o $name.html 
##      pandoc $name.md -o $name.pdf --pdf-engine=xelatex -V mainfont="Source Han Serif CN"
    fi } &
  done
  wait 
  echo 'finish'
}
 
IFS=$'\n'
INIT_PATH=".";
ergodic $INIT_PATH
