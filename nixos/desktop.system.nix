{ pkgs, ... }:
{
	# Graphical environment
	
	# Enable the X11 windowing system.
	services.xserver.enable = true;

	# Enable the GNOME Desktop Environment.
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;

	environment.sessionVariables.NIXOS_OZONE_WL = "1";
	environment.gnome.excludePackages = with pkgs.gnome; [
		baobab      # disk usage analyzer
		cheese      # photo booth
		# eog         # image viewer
		epiphany    # web browser
		gedit       # text editor
		simple-scan # document scanner
		totem       # video player
		yelp        # help viewer
		evince      # document viewer
		file-roller # archive manager
		geary       # email client
		seahorse    # password manager

		gnome-maps
		gnome-music
		pkgs.gnome-tour
		gnome-weather
		# gnome-photos
		gnome-contacts
		gnome-terminal
		pkgs.gnome-connections
	];
	
	services.xserver.excludePackages = [ pkgs.xterm ];

	services.flatpak.enable = true;
	# environment.etc = {
	#   "flatpak/remotes.d/flathub.flatpakrepo".source = pkgs.fetchurl {
	#     url = "https://dl.flathub.org/repo/flathub.flatpakrepo";
	#     # Let this run once and you will get the hash as an error.
	#     hash = "";
	#   };
	# };

	# Enable sound with pipewire.
	sound.enable = true;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		#jack.enable = true;

		# use the example session manager (no others are packaged yet so this is enabled by default,
		# no need to redefine it in your config for now)
		#media-session.enable = true;
	};
}
