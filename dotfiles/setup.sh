#!/bin/bash 

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

if [[ "$MACHINE" == "Linux" ]]
  then 
    source dotfiles/windows/setup.sh
elif [[ "$MACHINE" == "Mac" ]]
  then 
    source dotfiles/mac/setup.sh
fi
