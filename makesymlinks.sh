#!/bin/bash

codepath=~/Code
dir=$codepath/dotfiles-big-sur
olddir=$codepath/dotfiles-big-sur-old
files=".zshrc .gitconfig .gitignore_global"

mkdir -p $olddir
cd $dir

for file in $files; do
    echo "Moving existing file to $olddir..."
	if [ -f ~/$file ];
    then
      mv ~/$file $olddir
    fi
	echo "Creating symlink to $file in home directory..."
	ln -s $dir/$file ~/$file
	echo "ln -sf $dir/$file ~/$file"
done
