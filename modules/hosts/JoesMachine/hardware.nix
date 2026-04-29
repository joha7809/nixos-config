{ self, inputs, ... }: {
  flake.nixosModules.JoesMachineHardware = 
	{ config, lib, pkgs, modulesPath, ... }:

	{
	  imports = [ ];

	  boot.initrd.availableKernelModules = [ "ehci_pci" "xhci_pci" "usbhid" "sr_mod" ];
	  boot.initrd.kernelModules = [ ];
	  boot.kernelModules = [ ];
	  boot.extraModulePackages = [ ];

	  fileSystems."/" =
	    { device = "/dev/disk/by-uuid/61afd17d-ef0a-4a50-9bd6-c099307fe9bb";
	      fsType = "ext4";
	    };

	  fileSystems."/boot" =
	    { device = "/dev/disk/by-uuid/7E17-1D03";
	      fsType = "vfat";
	      options = [ "fmask=0077" "dmask=0077" ];
	    };

	  swapDevices =
	    [ { device = "/dev/disk/by-uuid/3853dd97-b78b-4d81-8f88-e01febb4aff2"; }
	    ];

	  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
	  hardware.parallels.enable = true;
	  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "prl-tools" ];
	};
}
