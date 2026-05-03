{ inputs, lib, ... }:
{
  flake.nixosModules.clipboard =
    { pkgs, ... }:
    # let
    #   overlay = final: prev: {
    #     cursor-clip = prev.cursor-clip.overrideAttrs (old: {
    #       nativeBuildInputs = (old.nativeBuildInputs or []) ++ [
    #         final.wrapGAppsHook3
    #       ];
    #
    #       buildInputs = (old.buildInputs or []) ++ [
    #         final.gsettings-desktop-schemas
    #         final.glib
    #         final.gtk4
    #         final.libadwaita
    #       ];
    #     });
    #   };
    # in
    # {
    #   nixpkgs.overlays = [ overlay ];
    #
    #   programs.dconf.enable = true;
    #
    #   environment.systemPackages = with pkgs; [
    #     wl-clipboard
    #     cursor-clip
    #     gtk4-layer-shell
    #   ];
    # };
    {
      environment.systemPackages = [
        pkgs.cursor-clip
      ];
    };
}
