{ ... }: {
  flake.nixosModules.system-packages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      git
      curl
      wget
    ];
  };
}
