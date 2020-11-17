#!/bin/bash

userpath="/Users/Mike"
codepath="$userpath/Code"
dir="$codepath/dotfiles-big-sur"
olddir="$codepath/dotfiles-big-sur-old"
dotfiles=".zshrc .gitconfig .gitignore_global"

vscfilesdir="VSCode"
vscfile="settings.json"
vscdir="$userpath/Library/Application Support/Code/User"

xcodefilesdir="Xcode"
xcodefile="Material Palenight.xccolortheme"
xcodedir="$userpath/Library/Developer/Xcode/UserData/FontAndColorThemes"

mkdir -p $olddir
cd $dir

# dotfiles
for dotfile in $dotfiles; do
    echo "Moving existing file to $olddir"
	if [ -f ~/$dotfile ];
    then
      mv ~/$dotfile $olddir
    fi
	echo "Creating symlink to $dotfile in $userpath"
	ln -sf $dir/$dotfile ~/$dotfile
done

# VSCode
if [ -f "$vscdir/$vscfile" ];
  then
    mv "$vscdir/$vscfile" "$olddir"
  fi
echo "Creating symlink to $vscfile in $vscdir"
ln -sf "$dir/$vscfilesdir/$vscfile" "$vscdir/$vscfile"

# Xcode
if [ -f "$xcodedir/$xcodefile" ];
  then
    mv "$xcodedir/$xcodefile" "$olddir"
  fi
echo "Creating symlink to $xcodefile in $xcodedir"
ln -sf "$dir/$xcodefilesdir/$xcodefile" "$xcodedir/$xcodefile"
