# My Linux Dotfiles

These are my dotfiles and general system preferences adapted (loosely speaking) for Ubuntu. They'll probably work fine with any Debian-based distro, but I've only tested them on Ubuntu.

**Running OS X? Check out the [master branch](https://github.com/joshukraine/dotfiles).**

### Suppported distros

This script has been successfully testing on the following Linux distros:

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
wget -qO- https://raw.githubusercontent.com/joshukraine/dotfiles/linux/setup-linux.sh
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

...

### Post-install Tasks

...

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



