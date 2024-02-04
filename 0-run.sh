#!/usr/bin/env bash

# Nix Config
sudo rm -rd /etc/nixos
sudo ln -sfn ~/dotfiles/nixos /etc/nixos

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
rm -rd ~/.config/starship
ln -s ~/dotfiles/starship ~/.config/starship

# Neovim
rm -rd ~/.config/nvim
ln -sfn ~/dotfiles/nvim ~/.config/nvim

# VSCode settings.json
rm ~/.config/Code/User/settings.json
ln -s ~/dotfiles/Code/User/settings.json ~/.config/Code/User/settings.json

# Hyper
rm -rd ~/.config/hypr
ln -sfn ~/dotfiles/hypr ~/.config/hypr

rm -rd ~/.config/waybar
ln -sfn ~/dotfiles/waybar ~/.config/waybar

rm -rd ~/.config/swaylock
ln -sfn ~/dotfiles/swaylock ~/.config/swaylock

rm -rd ~/.config/wlogout
ln -sfn ~/dotfiles/wlogout ~/.config/wlogout

rm -rd ~/.config/swappy
ln -sfn ~/dotfiles/swappy ~/.config/swappy
