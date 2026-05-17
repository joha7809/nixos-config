{ noctalia, ... }:
{
  # home.packages = with pkgs; [
  #   noctalia-shell
  # ];

  # import the home manager module
  imports = [
    noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure options
    };
  };
}
