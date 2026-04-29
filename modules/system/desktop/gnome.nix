{ ... }: {
  flake.nixosModules.desktop-gnome = { ... }: {
    services.xserver.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  };
}
