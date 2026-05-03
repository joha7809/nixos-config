{ lazyvim, pkgs, ... }: {
  imports = [ lazyvim.homeManagerModules.default ];
  programs.lazyvim = {
      enable = true;

      extras = {
          lang = {
            nix.enable = true;
            nix.installDependencies = true;
            rust.enable = true;
          };
      };

      extraPackages = with pkgs; [
        statix
        nixd
        alejandra
      ];
  };
}
