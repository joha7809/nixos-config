{ self, ... }: 
  let
    gitModule = import ../../home-modules/git.nix;
  in
{
  flake.homeManagerModules.default = {...}: {
    home.stateVersion = "24.05";
    programs.git = {
      enable = true;
      userName = "joha7809";
      userEmail = "joha7809@gmail.com";
    };
    programs.neovim.enable = true;
  };
}
