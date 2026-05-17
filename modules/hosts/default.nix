{ self, inputs, ... }:
let
  mkHost =
    {
      hostModule,
      systemModule,
      homeProfile,
      extraModules ? [ ],
    }:
    inputs.nixpkgs.lib.nixosSystem {
      modules = [
        self.nixosModules.system-base
        self.nixosModules.system-packages
        self.nixosModules.home-manager
        self.nixosModules.user-johannes
        self.nixosModules.keyboard
        self.nixosModules.clipboard
        self.nixosModules.auth
        hostModule
        systemModule
        { johannes.homeProfile = homeProfile; }
      ]
      ++ extraModules;
    };
in
{
  flake.nixosConfigurations = rec {
    joes-machine-hyprland = mkHost {
      hostModule = self.nixosModules.host-joes-machine;
      systemModule = self.nixosModules.desktop-hyprland;
      homeProfile = "hyprland";
    };

    joes-machine-gnome = mkHost {
      hostModule = self.nixosModules.host-joes-machine;
      systemModule = self.nixosModules.desktop-gnome;
      homeProfile = "gnome";
    };

    joes-desktop = mkHost {
      hostModule = self.nixosModules.host-desktop;
      systemModule = self.nixosModules.desktop-hyprland;
      homeProfile = "hyprland";

      extraModules = [
        self.nixosModules.gaming
      ];
    };

    # Legacy aliases, kept so existing commands still work.
    Hyprland = joes-machine-hyprland;
    Gnome = joes-machine-gnome;

    Desktop = joes-desktop;
  };
}
