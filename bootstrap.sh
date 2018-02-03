#!/bin/bash

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="config local vim bashrc gtkrc-2.0 profile xsessionrc"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file ~/dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done
