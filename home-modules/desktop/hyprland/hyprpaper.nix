{ ... }:
{
  services.hyprpaper.settings = {
    wallpaper = [
      {
        monitor = "eDP-1";
        path = builtins.path { path = ./wallhaven-gw7d93_1920x1080.png; };
      }
    ];
  };
}
