
{ self, ... }: {
  flake.nixosModules.DesktopConfiguration = { lib, config, ... }: {
    imports = [
      # Include the results of the hardware scan.
      self.nixosModules.DesktopHardware
    ];

    networking.hostName = lib.mkDefault "joes-desktop";
    # NVIDIA RTX 3080
     services.xserver.videoDrivers = [ "nvidia" ];
     hardware.graphics.enable = true;
     hardware.nvidia = {
       modesetting.enable = true;
       open = false; # good default for 3080
       nvidiaSettings.enable = true;
       package = config.boot.kernelPackages.nvidiaPackages.stable;
     };
  };
}
