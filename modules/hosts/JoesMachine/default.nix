{ self, inputs, ... }: {
  
  flake.nixosConfigurations.JoesMachine = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.system-packages
      self.nixosModules.home-manager
      self.nixosModules.JoesMachineConfiguration
      self.nixosModules.keyboard
    ];
  };

}
