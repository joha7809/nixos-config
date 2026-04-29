{ self, ... }: {
  flake.nixosModules.user-johannes = { config, lib, ... }:
    let
      homeProfile =
        if config.johannes.homeProfile == "hyprland"
        then self.homeManagerModules.profile-hyprland
        else self.homeManagerModules.profile-gnome;
    in
    {
      options.johannes.homeProfile = lib.mkOption {
        type = lib.types.enum [ "hyprland" "gnome" ];
        default = "hyprland";
        description = "Home Manager desktop profile for user joe.";
      };

      config = {
        users.users.johannes = {
          isNormalUser = true;
          extraGroups = [ "wheel" "networkmanager" ];
        };

        home-manager.users.joe = {
          imports = [ homeProfile ];
        };
      };
    };
}
