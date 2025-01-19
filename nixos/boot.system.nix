{
	# Bootloader
	boot = {
		supportedFilesystems = [ "ntfs" ];
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
			efi = {
				canTouchEfiVariables = true;
				efiSysMountPoint = "/boot";
			};
			grub = {
				enable = true;
				devices = [ "nodev" ];
				efiSupport = true;
				useOSProber = true;
			};
		};
	};
}
