# Linux Dotfiles

These are essentially the same as those I use on my primary, OS X machine. A few tweaks have been made so they will play nicely with Ubuntu.

Speaking of Ubuntu, that's the flavor of Linux I use and I've not tried these dotfiles on any other distro. I'm guessing they'd work fine, but just a heads-up.


### Assumptions

The dotfiles assume that you have a couple of things installed, namely:

* [`rbenv`](https://github.com/sstephenson/rbenv)
* [`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh)
* various `vim` plugins installed with Vundle

If you don't want to use those, you'll need to remove or comment out the relevant lines in the various rc files. Otherwise, you'll get some errors.


### Initial Setup

Patch the system.

	sudo apt-get update && sudo apt-get upgrade -y
	
Add tmux ppa.
	
	sudo add-apt-repository ppa:pi-rho/dev
	sudo apt-get update
	
Install basic tools.
	
	sudo apt-get remove vim-tiny -y
	sudo apt-get install -y git curl vim htop tmux tree zsh

Install Ruby/Rails dependencies if desired.

	sudo apt-get install -y python-software-properties build-essential nodejs zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev
	

### Install Custom Users

If needed, install custom users here. Subsequent steps are user-specific.

	sudo adduser --shell /bin/zsh joshukraine
	sudo usermod -aG sudo joshukraine

Restart the system.

	sudo reboot
	
From local machine, copy over the public key for `joshukraine`.

	ssh-copy-id <ip address>
	
Log in as `joshukraine`.

	ssh <ip address>


### Setup [`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh)

Download and install.

    curl -L http://install.ohmyz.sh | sh

Reload the shell to complete the install.

	exec $SHELL
	

### Install Dotfiles

1) Clone this repo.

    git clone -b linux https://github.com/joshukraine/dotfiles.git ~/.dotfiles

2) Symlink the rc files.

    ln -nfs ~/.dotfiles/gemrc ~/.gemrc
    ln -nfs ~/.dotfiles/gitignore ~/.gitignore_global
    ln -nfs ~/.dotfiles/gitconfig ~/.gitconfig
    ln -nfs ~/.dotfiles/tmux.conf ~/.tmux.conf
    ln -nfs ~/.dotfiles/railsrc ~/.railsrc
    ln -nfs ~/.dotfiles/vimrc ~/.vimrc
    ln -nfs ~/.dotfiles/zshrc ~/.zshrc
    source ~/.zshrc
    

### Install Vundle for `vim`

1) Set up the `~/.vim/bundle` directory needed by the [Vundle](https://github.com/gmarik/Vundle.vim) plugin manager.

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

2) Install `vim` plugins with [Vundle](https://github.com/gmarik/Vundle.vim).

    vim +PluginInstall +qall


### Setup [`rbenv`](https://github.com/sstephenson/rbenv)


1) Clone the needed files.

	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

2) Pick up the changes.

	source ~/.zshrc

3) Reload the shell

	exec $SHELL

	
### Install Ruby

	rbenv install -v 2.2.0
	rbenv global 2.2.0
	gem install bundler


### Extras

I use [`tmuxinator`](https://github.com/tmuxinator/tmuxinator) for quickly setting up `tmux` environments.

    gem install tmuxinator

I use the [solarized](https://github.com/altercation/solarized) color scheme (dark) for terminal and `vim`. Be sure to uncomment the appropriate lines in the `vimrc` file. (under the Colorscheme section)

I use the [Inconsolata font](http://www.levien.com/type/myfonts/inconsolata.html), which you can get optimized for Powerline here: https://github.com/Lokaltog/powerline-fonts. This is also helpful for vim-airline, since it uses some of Powerlines custom symbols.

In case you're not me, you'll want to add your own name and email to `~/.dotfiles/gitconfig`.

	git config --global user.name "John Doe"
	git config --global user.email johndoe@example.com

### Some of my favorite dotfile repos

* [Pro Vim](https://github.com/Integralist/ProVim)
* [Ryan Bates](https://github.com/ryanb/dotfiles)
* [thoughtbot](https://github.com/thoughtbot/dotfiles)
* [Ben Orenstein](https://github.com/r00k/dotfiles)
* [Joshua Clayton](https://github.com/joshuaclayton/dotfiles)
* [Drew Neil](https://github.com/nelstrom/dotfiles)
* [Chris Toomey](https://github.com/christoomey/dotfiles)