{ ... }:
{
  imports = [
    ../core/git.nix
    ../core/neovim.nix
    ../core/fonts.nix
  ];

  home.stateVersion = "24.05";
}
