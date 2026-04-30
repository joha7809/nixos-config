{ inputs, ... }: {
  _module.args = { inherit inputs; };
  flake.homeManagerModules = rec {
    profile-base = import ../../home-modules/profiles/base.nix;
    profile-hyprland = import ../../home-modules/profiles/hyprland.nix;
    profile-gnome = import ../../home-modules/profiles/gnome.nix;
    default = profile-hyprland;
  };
}
