{inputs, ...}: {
  flake.nixosModules.home-manager = { ... }: {
    imports = [
	inputs.home-manager.nixosModules.home-manager
    ];
    home-manager.extraSpecialArgs = {
      inherit (inputs) lazyvim;
    };
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    #To keep exsisting dotfiles we can back them up
    home-manager.backupFileExtension = "hm-backup";
  };
}
