
{ self, inputs, ... }: {
  flake.nixosModules.JoesMachineConfiguration = { config, lib, pkgs, ... }:
	{
	imports =
	[ # Include the results of the hardware scan.
	  self.nixosModules.JoesMachineHardware
	];
	# Lets enable experimental features
	nix.settings.experimental-features = ["nix-command" "flakes" ];

	# Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos"; # Define your hostname.

	# Configure network connections interactively with nmcli or nmtui.
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Europe/Copenhagen";

	users.users.joe = {
	  isNormalUser = true;
	  extraGroups = [ "wheel" "networkmanager" ];
          initialPassword = "test";
        };

        home-manager.users.joe = self.homeManagerModules.default;
        console.useXkbConfig = true;

	security.sudo.enable = true;
	security.sudo.wheelNeedsPassword = false;
	services.pipewire = {
	  enable = true;
	  pulse.enable = true;
	  alsa.enable = true;
	};

	programs.vim.enable = true;
	programs.firefox.enable = true;
	programs.hyprland = {
	  enable = true;
	  xwayland.enable = true;
	};
        services.xserver.enable = true;
        services.xserver.displayManager.gdm.enable = true;

        security.polkit.enable = true;
        xdg.portal.enable = true;
        xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

	};
}
