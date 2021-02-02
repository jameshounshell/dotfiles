# dotfiles
This repo automates user configuration and software installation

- first, packages are managed with home`brew` (osx) or `apt` (ubuntu)
- second, dotfiles and configuration are managed with `stow`
    - stow takes each folder, for instance the `nvim` folder, 
      and symlinks the files in the folder to same path in the $HOME directory
      ex: ~/dotfiles/.config/nvim/init.vim is symlinked to ~/.config/nvim/init.vim
    - any parent folders are automatically created

# install
- `git clone git@github.com:jameshounshell/dotfiles.git ~/dotfiles`
- `cd ~/dotfiles`
- first install software
    - `make brew` installs all osx packages using `brew`
    - or `make apt` installs all packages using `apt`
- second install config/dotfiles
    - `make stow` symlinks all files in this repo to their corresponding location in $HOME

# Caveats
- Exclude iterm2 folder from stow command

# update package lists
Before moving to a new machine make sure to update `brew_formula` and `brew_casks`
- `make brew_update_packages`
- `make apt_update_packages`
