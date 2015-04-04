#!/bin/sh

################################################################################
# setup-linux.sh
#
# This script is intended to set up a new Linux (mainly Ubuntu) computer with my
# dotfiles and other development preferences.
# NOTE: This Ubuntu config is for a local dev machine, not a web-facing server.
#
# Much of this script was derived from thoughtbot's now unsupported Linux
# version of Laptop.
# https://github.com/thoughtbot/laptop/tree/39768b19959f74724ed0c0ea92e5b2f6f78e45c1
################################################################################

################################################################################
# First, some helpful functions borrowed from Laptop. Thank you, thoughtbot. :)
################################################################################

fancy_echo() {
  printf "\n%b\n" "$1"
}

append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="$2"

  if [[ -w "$HOME/.zshrc.local" ]]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if (( skip_new_line )); then
      printf "%s\n" "$text" >> "$zshrc"
    else
      printf "\n%s\n" "$text" >> "$zshrc"
    fi
  fi
}

################################################################################
# Next, a little more setup...
################################################################################

set -e # Terminate script if anything exits with a non-zero value
set -u # Prevent unset variables

osname=$(uname)
divider="====> "
DOTFILES_DIR=$HOME/dotfiles

################################################################################
# Make sure we're on a Linux before continuing.
################################################################################

if [[ "$osname" == 'Darwin' ]]; then
  fancy_echo "Oops, looks like you're on a Mac. Please run the command
below to download and execute the Mac setup script."
  fancy_echo "curl --remote-name https://raw.githubusercontent.com/joshukraine/dotfiles/master/setup-mac.sh && sh setup.sh 2>&1 | tee ~/setup.log"
  exit 1
elif [[ "$osname" != 'Linux' ]]; then
  fancy_echo "Oops, it looks like you're using a non-UNIX system. This script
only supports Mac and Linux. Exiting..."
  exit 1
fi

################################################################################
# Update the system.
################################################################################

fancy_echo "Updating system packages ..."

if command -v aptitude >/dev/null; then
  fancy_echo "Using aptitude ..."
else
  fancy_echo "Installing aptitude ..."
  sudo apt-get install -y aptitude
fi

sudo aptitude update

################################################################################
# 1. Install basic tools
################################################################################

fancy_echo "$divider Step 1: Installing basic tools..."

fancy_echo "Installing curl ..."
sudo aptitude install -y curl

fancy_echo "Installing git..."
sudo aptitude install -y git

fancy_echo "Installing python software properties..."
sudo aptitude install -y python-software-properties

fancy_echo "Installing build-essential..."
sudo aptitude install -y build-essential

fancy_echo "Installing libraries for common Ruby/Rails/gem dependencies..."
sudo aptitude install -y libxslt1-dev libcurl4-openssl-dev libksba8 libksba-dev libqtwebkit-dev libreadline-dev zlib1g-dev libssl-dev libyaml-dev libxml2-dev libffi-dev

fancy_echo "Installing sqlite3..."
sudo aptitude install -y libsqlite3-dev sqlite3

fancy_echo "Installing Postgres..."
sudo aptitude install -y postgresql postgresql-server-dev-all

fancy_echo "Installing Redis..."
sudo aptitude install -y redis-server

fancy_echo "Installing ctags..."
sudo aptitude install -y exuberant-ctags

fancy_echo "Installing vim ..."
sudo aptitude remove vim-tiny -y
sudo aptitude install -y vim-gtk

fancy_echo "Installing htop..."
sudo aptitude install -y htop

fancy_echo "Installing tree..."
sudo aptitude install -y tree

fancy_echo "Installing tmux (using tmux ppa)..."
sudo add-apt-repository ppa:pi-rho/dev -y
sudo aptitude update
sudo aptitude install -y tmux

fancy_echo "Installing ImageMagick..."
sudo aptitude install -y imagemagick

fancy_echo "Installing zsh..."
sudo aptitude install -y zsh

fancy_echo "Installing node..."
sudo aptitude install -y nodejs

fancy_echo "Installing xclip..."
sudo aptitude install -y xclip

fancy_echo "Installing gnome-tweak-tool..."
sudo aptitude install -y gnome-tweak-tool

fancy_echo "Installing Terminator!!! :D ..."
sudo aptitude install -y terminator

################################################################################
# 2. Install oh-my-zsh
################################################################################

fancy_echo "$divider Step 2: Installing oh-my-zsh..."

if [ -d "$HOME/.oh-my-zsh" ]; then
  rm -rf $HOME/.oh-my-zsh
fi
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

fancy_echo "Changing your shell to zsh ..."
chsh -s $(which zsh)

################################################################################
# 3. Setup basic directories
################################################################################

fancy_echo "$divider Step 3: Creating a few basic directories..."

mkdir -p $HOME/code
mkdir -p $HOME/Developer/training
mkdir -p $HOME/Developer/vms
mkdir -p $HOME/Developer/cheatsheets
mkdir -p $HOME/Developer/other_code
mkdir -p $HOME/Developer/fav_repos
mkdir -p $HOME/src

################################################################################
# 4. Setup dotfiles
################################################################################

fancy_echo "$divider Step 4: Installing dotfiles..."

cd $HOME
if [ ! -d $DOTFILES_DIR ]; then
  git clone -b linux https://github.com/joshukraine/dotfiles.git $DOTFILES_DIR
else
  cd $DOTFILES_DIR
  git pull origin master
fi
fancy_echo "Starting dotfiles setup script (install/symlink_dotfiles.sh)..."
source "$DOTFILES_DIR/install/symlink_dotfiles.sh"
fancy_echo "Dotfiles setup complete! Resuming main setup script..."

################################################################################
# 5. Install Powerline-patched fonts
################################################################################

fancy_echo "$divider Step 5: Installing fixed-width fonts patched for use with Powerline symbols..."

if [ -d "$HOME/src/fonts" ]; then
  rm -rf $HOME/src/fonts
fi
git clone https://github.com/powerline/fonts.git $HOME/src/fonts
cd $HOME/src/fonts
./install.sh
cd $HOME
rm -rf $HOME/src/fonts
fancy_echo "Done!"

################################################################################
# 6. Install Vundle and vim plugins
################################################################################

fancy_echo "$divider Step 6: Installing Vundle and vim plugins..."

source "$DOTFILES_DIR/install/vundle.sh"
fancy_echo "Done!"

################################################################################
# 7. Install rbenv and ruby-build
################################################################################

fancy_echo "$divider Step 7: Installing rbenv and ruby-build..."

if [[ ! -d "$HOME/.rbenv" ]]; then
  fancy_echo "Installing rbenv..."
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh)"
fi

if [[ ! -d "$HOME/.rbenv/plugins/ruby-build" ]]; then
  fancy_echo "Installing ruby-build..."
  git clone https://github.com/sstephenson/ruby-build.git \
    ~/.rbenv/plugins/ruby-build
fi

################################################################################
# 8. Install Ruby, Rails, and friends
################################################################################

fancy_echo "$divider Step 8: Installing Ruby, Rails, and friends..."

ruby_version="$(curl -sSL http://ruby.thoughtbot.com/latest)"

fancy_echo "Installing Ruby $ruby_version ..."
rbenv install -s "$ruby_version"

fancy_echo "Setting $ruby_version as global default Ruby ..."
rbenv global "$ruby_version"

fancy_echo "Updating to latest Rubygems version ..."
gem update --system

fancy_echo "Installing Bundler..."
gem install bundler --no-document --pre

fancy_echo "Installing Rails..."
gem install rails

################################################################################
# 9. Install Google Chrome
################################################################################

fancy_echo "$divider Step 9: Installing Google Chrome..."

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo aptitude update
sudo aptitude install -y google-chrome-stable

echo ""
echo "**************************************************************"
echo "**** Setup script complete! Please restart your computer. ****"
echo "**************************************************************"
echo ""

exit 1
