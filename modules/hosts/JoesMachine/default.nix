{ self, ... }: {
  flake.nixosModules.host-joes-machine = { ... }: {
    imports = [
      self.nixosModules.JoesMachineConfiguration
    ];
  };
}
