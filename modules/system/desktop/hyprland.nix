{ ... }: {
  flake.nixosModules.desktop-hyprland = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kitty
      wofi
      waybar
    ];

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    programs.waybar = {
      enable = true;
    };

    services.xserver.enable = true;
    services.displayManager.gdm.enable = true;

    security.polkit.enable = true;
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
