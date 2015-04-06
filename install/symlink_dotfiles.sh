#!/bin/sh

################################################################################
# symlink_dotfiles.sh
#
# This script backs up any old dotfiles on the system, and symlinks the new ones
# to their proper place in the home folder.
################################################################################

set -e # Terminate script if anything exits with a non-zero value
set -u # Prevent unset variables

################################################################################
# Set some variables
################################################################################

DOTFILES_DIR=$HOME/dotfiles
files="gemrc gitignore_global gitconfig tmux.conf railsrc vimrc zshrc"

cd $HOME

################################################################################
# Symklink new dotfiles to $HOME
################################################################################

fancy_echo "Creating symlinks..."
for file in $files; do
  if [ -f $HOME/.$file ]; then
    echo ".$file already present. Backing up..."
    cp $HOME/.$file "$HOME/.${file}_backup"
    rm -f $HOME/.$file
  fi
  fancy_echo "-> Linking $DOTFILES_DIR/$file to $HOME/.$file..."
  ln -nfs "$DOTFILES_DIR/$file" "$HOME/.$file"
done

