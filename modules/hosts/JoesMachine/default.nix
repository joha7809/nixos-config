{ self, inputs, ... }: {
  
  flake.nixosConfigurations.JoesMachine = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.system-packages
      self.nixosModules.desktop-hyprland
      self.nixosModules.home-manager
      self.nixosModules.user-johannes
      self.nixosModules.JoesMachineConfiguration
      self.nixosModules.keyboard
    ];
  };

}
