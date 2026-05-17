{ ... }:
{
  flake.nixosModules.gaming =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    {

      environment.systemPackages = with pkgs; [
        heroic
        protonup-qt
        mangohud
        #goverlay
        solaar # For mouse settings
      ];

      programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
      };

      programs.gamemode.enable = true;
    };
}
