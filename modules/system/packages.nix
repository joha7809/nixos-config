{ ... }: {
  flake.nixosModules.system-packages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kitty
      wofi
      git
      curl
      wget
      gdm
    ];
  };
}
