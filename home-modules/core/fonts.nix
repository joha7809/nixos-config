{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts._0xproto
  ];
  fonts.fontconfig.enable = true;
}
