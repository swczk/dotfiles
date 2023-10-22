#!/usr/bin/env bash

# Nix Config
rm -rd /etc/nixos
ln -sfn ~/dotfiles/nixos /etc/nixos

# Git
rm ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
rm ~/.gitignore_global
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global

# ZSH
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
rm ~/.zshenv
ln -s ~/dotfiles/.zshenv ~/.zshenv

# Alacritty
rm -rd ~/.config/alacritty
ln -sfn ~/dotfiles/alacritty ~/.config/alacritty

# StarShip starship.toml
rm ~/.config/starship/starship.toml
ln -s ~/dotfiles/starship/starship.toml ~/.config/starship/starship.toml

# Neovim
rm -rd ~/.config/nvim
ln -sfn ~/dotfiles/nvim ~/.config/nvim

# VSCode settings.json
rm ~/.config/Code/User/settings.json
ln -s ~/dotfiles/Code/User/settings.json ~/.config/Code/User/settings.json
