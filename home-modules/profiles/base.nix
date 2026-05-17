{ ... }:
{
  imports = [
    ../core/git.nix
    ../core/neovim.nix
    ../core/fonts.nix
    ../core/fish.nix
    ../core/starship.nix
  ];

  home.stateVersion = "24.05";
}
