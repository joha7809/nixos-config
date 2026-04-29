{ ... }: {
  imports = [
    ../core/git.nix
    ../core/neovim.nix
  ];

  home.stateVersion = "24.05";
}
