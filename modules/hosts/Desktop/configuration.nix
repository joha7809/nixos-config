{ self, ... }:
{
  flake.nixosModules.DesktopConfiguration =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    {
      imports = [
        # Include the results of the hardware scan.
        self.nixosModules.DesktopHardware
      ];

      nixpkgs.config.allowUnfree = true;
      boot.kernelParams = [ "nvidia-drm.modeset=1" ];
      boot.kernelPackages = pkgs.linuxPackages_zen;

      environment.systemPackages = with pkgs; [
        discord-ptb
      ];
      networking.hostName = lib.mkDefault "joes-desktop";
      # NVIDIA RTX 3080
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.graphics.enable = true;
      hardware.graphics.enable32Bit = true;
      hardware.xone.enable = true;

      hardware.nvidia = {
        modesetting.enable = true;
        open = false; # good default for 3080
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
      };

      powerManagement.cpuFreqGovernor = "perfomance";
    };
}
