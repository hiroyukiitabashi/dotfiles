#!/bin/bash

set -u
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR
git submodule init
git submodule update

for f in _??*
  do
#   echo "$f"
     [[ "$f" == ".git" ]] && continue
     [[ "$f" == ".DS_Store" ]] && continue
     b=`echo $f | sed -e "s/_\(.*\)/\.\1/"`
#    echo "$b"
     ln -snfv ~/dotfiles/"$f" ~/"$b"
#     echo "$f" | sed -e "s/_\(.*\)/\.\1/"
 done
