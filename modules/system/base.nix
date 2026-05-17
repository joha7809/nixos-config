{ ... }:
{
  flake.nixosModules.system-base =
    { ... }:
    {
      # Lets enable experimental features
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Use the systemd-boot EFI boot loader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      # Configure network connections interactively with nmcli or nmtui.
      networking.networkmanager.enable = true;

      services.power-profiles-daemon.enable = true;

      # Set your time zone.
      time.timeZone = "Europe/Copenhagen";

      security.sudo.enable = true;
      security.sudo.wheelNeedsPassword = false;

      services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
      };

      programs.vim.enable = true;
      programs.firefox.enable = true;
      programs.fish.enable = true;
    };
}
