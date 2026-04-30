{inputs, ... }: {
  flake.nixosModules.clipboard = {pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      wl-clipboard
      cursor-clip
    ];
  };
}
