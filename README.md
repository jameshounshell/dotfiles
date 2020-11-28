# dotfiles
This repo automates user configuration and software installation

dotfiles and configuration are managed with `stow`
packages are managed with home`brew` (osx) or `apt` (ubuntu)


# install
- `git clone git@github.com:jameshounshell/dotfiles.git ~/dotfiles`
- `cd ~/dotfiles`

# configure
- `make brew` installs all osx packages using `brew`
- `make apt` installs all packages using `apt`

# update package lists
- `make brew_update_packages`
- `make apt_update_packages`
