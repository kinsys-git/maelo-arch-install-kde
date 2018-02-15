#!/bin/bash

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="config local vim bashrc profile xsessionrc kde4"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file $olddir/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done
