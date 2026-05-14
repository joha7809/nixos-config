{ self, ... }: {
  flake.nixosModules.JoesMachineConfiguration = { lib, ... }: {
    imports = [
      # Include the results of the hardware scan.
      self.nixosModules.JoesMachineHardware
    ];

    networking.hostName = lib.mkDefault "joes-machine";
  };
}
