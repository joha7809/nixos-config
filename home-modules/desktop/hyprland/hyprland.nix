{ pkgs, ... }:
{

  home.packages = with pkgs; [
    alacritty
    wofi
    waybar
    mako
    pamixer
    hyprlock
  ];

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = import ./settings.nix;
  wayland.windowManager.hyprland.systemd.enable = true;
  wayland.windowManager.hyprland.systemd.variables = [ "--all" ];

  services.hyprpaper.enable = true;
  services.mako.enable = true;

  programs.waybar.enable = true;
  programs.hyprlock.enable = true;
  programs.alacritty.enable = true;

  xdg.portal = {
    enable = true;

    config = {
      common.default = [
        "hyprland"
        "gtk"
      ];
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}
