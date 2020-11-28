# makefile for managing dotfiles and software

# preflight checks
# ================
# osx checks
UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
  ifeq (, $(shell which brew))
    $(error "Homebrew not installed in PATH, run `make osx_install_brew`")
  endif
endif
# stow check
ifeq (, $(shell which stow))
  $(error "stow not installed in PATH, please install it")
endif

# default target, shows readme and lists make targets
.PHONY: list
list:
	@head -n 5 README.md
	@printf "\n[See README.md for more info.]\n\n\nAvailable Make commands:\n===========\n"
	@#https://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'



# ========
# dotfiles
# ========
all_dirs = nvim tmux zsh
stow:
	stow $(all_dirs)

restow:
	stow -R $(all_dirs)

unstow:
	stow -D $(all_dirs)


# ========
# osx
# ========
osx_install_brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew_install:
	brew install --formula $(shell cat brew_formula)
	brew install --casks $(shell cat brew_casks)

brew_upgrade:
	brew upgrade --formula $(shell cat brew_formula)
	brew upgrade --casks $(shell cat brew_casks)

brew_list_packages:
	brew list --formula > brew_formula
	brew list --casks > brew_casks

# ==============
# git submodules
# ==============
git_submodule_update:
	git submodule update --init --recursive
