
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

	# Configure network connections interactively with nmcli or nmtui.
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Europe/Copenhagen";

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
      };
}
