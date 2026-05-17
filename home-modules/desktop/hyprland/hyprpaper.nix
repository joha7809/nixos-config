{ ... }:
{
  services.hyprpaper.settings = {
    wallpaper = [
      {
        monitor = "";
        path = builtins.path { path = ./wallhaven-gw7d93_1920x1080.png; };
      }
    ];
  };
}
