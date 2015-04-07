# My Linux Dotfiles

These are my dotfiles and general system preferences adapted for Debian-type Linux systems.

**Running OS X? Check out the [master branch](https://github.com/joshukraine/dotfiles).**

### Supported distros

This script has been successfully tested on the following Linux distros:

* Ubuntu 14.04 LTS, 15.04 Beta 2
* Lubuntu 14.10
* Debian 7.8

### Installation

To install with a one-liner, run this:

```sh
bash <(wget -qO- https://raw.githubusercontent.com/joshukraine/dotfiles/linux/setup-linux.sh) 2>&1 | tee ~/setup-linux.log
```

Want to read through the script first?

```sh
wget -qO- https://raw.githubusercontent.com/joshukraine/dotfiles/linux/setup-linux.sh > setup-linux.sh
less setup-linux.sh
bash setup-linux.sh 2>&1 | tee ~/setup-linux.log
```

Just want to install and symlink the dotfiles?

```sh
git clone -b linux https://github.com/joshukraine/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash ./install/symlink_dotfiles.sh
```


### What does it do?

When you invoke `setup-linux.sh`, this is what it does in a nutshell:

* Patch the system and install various software packages
* Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* Set up some basic directories in `$HOME`
* Symlink dotfiles to `$HOME`
* Copy in solarized profile for [Terminator](https://launchpad.net/terminator)
* Install several fixed-width fonts.
* Install Vundle and plugins for vim.
* Install [rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build#readme)
* Install Ruby, Rails and related packages
* Install Google Chrome (for compatible distros)

### How to personalize these dotfiles for your own use.

No one else's dotfiles will ever be a perfect match for you. That said, if your needs are close enough to mine, you might benefit from using the same shell scripts and overall structure, and just swapping out the particulars with your own. Here's my recommended approach to doing that:

1) [Fork this repo](https://github.com/joshukraine/dotfiles/tree/linux#fork-destination-box) and clone your new fork to your local machine.

2) Review `setup-linux.sh` and determine which sections you want to use.

* Section 1: Add/remove packages as desired.
* Section 2: Use oh-my-zsh? Prefer to use bash instead?
* Section 3: Customize your directories as desired.
* Section 4: Update the `git clone...` URL to point to your fork. Keep or remove Terminator customizations as desired. (NOTE: You can add your own Terminator profile if you like. Just name it `config` and place it in the `terminator` folder.)
* Section 5: Install fixed-width fonts?
* Section 6: Use Vundle? If you prefer a different plugin manager, you can add the code for that in file called `install/<my-plugin-manager>.sh` and then update the `source` path in this section.
* Section 7: Install `rbenv` and `ruby-build`? Use them, remove them, or code a different solution, such as [RVM](https://rvm.io/).
* Section 8: Adjust this section based on the decisions you made in Section 7.
* Section 9: Install Google Chrome? Or just use FireFox. It comes installed by default on Ubuntu, for example.

3) Customize the dotfiles themselves with your own prefs. Add or remove dotfiles as desired. Since the files will later be symlinked into place, there is no need to add the leading dot to the filenames. (e.g. use `vimrc`, not `.vimrc`)

4) Update `symlink_dotfiles.sh` to match your dotfiles. Find the following line of code (around line 18)...

	files="gemrc gitignore_global gitconfig tmux.conf railsrc vimrc zshrc"

...and make sure all your files (and *only* those files) are listed.

5) Update the README with your own info, instructions/reminders so you don't forget what you did, and especially the correct install URL:

	bash <(wget -qO- https://raw.githubusercontent.com/<your-github-username>/dotfiles/linux/setup-linux.sh) 2>&1 | tee ~/setup-linux.log

6) Run the script on your machine and wait for the first error. :) Then fix, commit, push, and repeat.

### Some of my favorite dotfile repos

* Pro Vim (https://github.com/Integralist/ProVim)
* Trevor Brown (https://github.com/Stratus3D/dotfiles)
* Lars Kappert (https://github.com/webpro/dotfiles)
* Ryan Bates (https://github.com/ryanb/dotfiles)
* thoughtbot (https://github.com/thoughtbot/dotfiles)
* Ben Orenstein (https://github.com/r00k/dotfiles)
* Joshua Clayton (https://github.com/joshuaclayton/dotfiles)
* Drew Neil (https://github.com/nelstrom/dotfiles)
* Chris Toomey (https://github.com/christoomey/dotfiles)
* Kevin Suttle (https://github.com/kevinSuttle/OSXDefaults)
* Carlos Becker (https://github.com/caarlos0/dotfiles)
* Zach Holman (https://github.com/holman/dotfiles/)
* Mathias Bynens (https://github.com/mathiasbynens/dotfiles/)
* Paul Irish (https://github.com/paulirish/dotfiles)

### Helpful web resources on dotfiles, et al.

* http://dotfiles.github.io/
* https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
* http://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449
* https://github.com/webpro/awesome-dotfiles
* http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
* http://carlosbecker.com/posts/first-steps-with-mac-os-x-as-a-developer/
* https://mattstauffer.co/blog/setting-up-a-new-os-x-development-machine-part-1-core-files-and-custom-shell
* http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/



