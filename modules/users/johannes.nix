{ self, inputs, ... }:
{
  flake.nixosModules.user-johannes =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      homeProfile =
        if config.johannes.homeProfile == "hyprland" then
          self.homeManagerModules.profile-hyprland
        else
          self.homeManagerModules.profile-gnome;
    in
    {
      options.johannes.homeProfile = lib.mkOption {
        type = lib.types.enum [
          "hyprland"
          "gnome"
        ];
        default = "hyprland";
        description = "Home Manager desktop profile for user johannes.";
      };

      config = {
        users.users.johannes = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
            "networkmanager"
          ];
          shell = pkgs.fish;
        };

        home-manager.users.johannes = {
          _module.args = {
            inherit inputs;
          };
          imports = [ homeProfile ];
        };
      };
    };
}
