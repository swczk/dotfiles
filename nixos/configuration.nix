{ config, pkgs, lib, ... }:
let
	identity = import ./resources/identity.nix;

	# nix-software-center = import (pkgs.fetchFromGitHub {
	#   owner = "vlinkz";
	#   repo = "nix-software-center";
	#   rev = "0.1.2";
	#   sha256 = "xiqF1mP8wFubdsAQ1BmfjzCgOD3YZf7EGWl9i69FTls=";
	# }) {};
in
{
	imports =
		[
			# Include the results of the hardware scan.
			./hardware-configuration.nix
			./desktop.system.nix
			./locale.system.nix
			./boot.system.nix
			# ./virtualization.nix
			#./security.nix
		];

	networking.hostName = "nixos"; # Define your hostname.
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# # Enable OpenGL
	# hardware.opengl = {
	# 	enable = true;
	# 	driSupport = true;
	# 	driSupport32Bit = true;
	# };
	# environment.variables = {
	# 	LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:/run/opengl-driver/lib:/run/opengl-driver-32/lib";
	# };

	# Load nvidia driver for Xorg and Wayland
	services.xserver.videoDrivers = [ "nvidia" ];
	hardware.nvidia = {
		# Modesetting is required.
		modesetting.enable = true;

		# Nvidia power management. Experimental, and can cause sleep/suspend to fail.
		powerManagement.enable = true;
		# Fine-grained power management. Turns off GPU when not in use.
		# Experimental and only works on modern Nvidia GPUs (Turing or newer).
		powerManagement.finegrained = false;

		# Use the NVidia open source kernel module (not to be confused with the
		# independent third-party "nouveau" open source driver).
		# Support is limited to the Turing and later architectures. Full list of
		# supported GPUs is at:
		# https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
		# Only available from driver 515.43.04+
		# Do not disable this unless your GPU is unsupported or if you have a good reason to.
		open = true;

		# Enable the Nvidia settings menu,
		# accessible via `nvidia-settings`.
		nvidiaSettings = false;

		# Optionally, you may need to select the appropriate driver version for your specific GPU.
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};

	# Configure keymap in X11
	services.xserver = {
		layout = "br";
		xkbVariant = "thinkpad";
	};

	# Configure console keymap
	console.keyMap = "br-abnt2";

	# Enable CUPS to print documents.
	# services.printing.enable = true;

	# Enable touchpad support (enabled default in most desktopManager).
	# services.xserver.libinput.enable = true;

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users = {
		defaultUserShell = pkgs.zsh;
		users.swczk = {
			isNormalUser = true;
			home = "/home/swczk";
			description = "Pedro Sawczuk";
			extraGroups = [ "wheel" "networkmanager" "vboxsf" "docker" "audio" ];
			shell = pkgs.zsh;
			packages = with pkgs; [
			];
			uid = 1000;
		};
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		git
		curl
		wget
		htop
		lshw
		nmap
		stow
		zsh
		traceroute
		neovim
		kitty
		neofetch
		oh-my-posh
		unzip
		unrar
		killall
		wl-clipboard

		# rofi-wayland
		hyprland
		# xdg-desktop-portal-wlr
		waybar
		# grim
		# slurp
		# swayidle
		# swaylock
		# swappy
		wofi
		# rofi
		# scrot
		# slock
		# xdg-utils # For opening default programs when clicking links
		# grim # Screenshot functionality
		# slurp # Screenshot functionality
		# wl-clipboard # wl-copy and wl-paste for copy/paste from stdin/stdout
		# cliphist
		# swww
		# swaylock-effects
		# wlogout
		# polybar
		# qtile
		# dunst
		# pywal

		obs-studio
		openh264
		ffmpeg
		x265
		x264
		vlc

		tailscale
		syncthing
		syncthingtray

		## Desktop Apps
		telegram-desktop
		libreoffice
		discord
		gparted
		vscode
		brave
		firefox

		## Rust Projects
		jp
		fd
		fzf
		lsd # The next gen ls command
		zoxide
		ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
		yazi # Blazing fast terminal file manager written in Rust, based on async I/O
		zellij

		font-awesome
		fira-code
		fira-mono

		docker-compose

		## Gnome Apps
		# gnome.gedit
		# gnome.nautilus
		gnome.gnome-software
		# nix-software-center

		## C++ -->
		gcc
		gdb

		## C# -->
		dotnet-sdk
		dotnet-runtime

		## JavaScript -->
		# nodejs

		## Go -->
		# go

		## Rust -->
		rustc
		# rustfmt
		cargo

		## JAVA -->
		# netbeans

		## OpenGL
		# glm
		# mesa
		# libGL
		# libGLU
		# freeglut

		## Static Website Engine
		# hugo

		## Raspberry Imager
		# rpi-imager

		## Temp
		# anydesk
		# gimp
	];

	# pkgs.catppuccin-gtk.override {
	#   accents = [ "mauve" ]; # You can specify multiple accents here to output multiple themes
	#   size = "compact";
	#   tweaks = [ "rimless" "black" ]; # You can also specify multiple tweaks here
	#   variant = "mocha";
	# };

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestions.enable = true;
	};

	services.tailscale = {
		enable = true;
		port = 41641;
		interfaceName = "tailscale0";
	};

	programs.hyprland = {
		enable = true;
		enableNvidiaPatches = true;
		xwayland.enable = true;
	};

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# Nix daemon config
	nix = {
		# Automate garbage collection
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		};

		settings = {
			# Automate `nix store --optimise`
			auto-optimise-store = true;
		};
	};

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?
}
