{ ... }:
{
  flake.nixosModules.desktop-hyprland =
    { pkgs, ... }:
    {

      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };

      programs.dconf.enable = true;

      services.displayManager.gdm.enable = true;
      services.xserver.enable = true;
      # services.xserver.updateDbusEnvironment = true;
      # services.dbus.implementation = "broker";

      security.polkit.enable = true;
      # xdg.portal = {
      #   enable = true;
      #   extraPortals = [
      #     pkgs.xdg-desktop-portal-hyprland
      #     pkgs.xdg-desktop-portal-gtk
      #   ];
      #
      #   config = {
      #     common.default = [ "hyprland" "gtk"];
      #     gtk.default = [ "gtk" ];
      #     hyprland.default = [ "hyprland" "gtk"];
      #   };
      # };
    };
}
