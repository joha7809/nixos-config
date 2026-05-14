
{ self, ... }: {
  flake.nixosModules.host-desktop = { ... }: {
    imports = [
      self.nixosModules.DesktopConfiguration
    ];
  };
}
