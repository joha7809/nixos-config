{
  monitor = [ "eDP-1,preferred,auto,1" ];

  "$mod" = "SUPER";

  general = {
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
    "col.active_border" = "rgba(88c0d0ff)";
    "col.inactive_border" = "rgba(3b4252ff)";
    layout = "dwindle";
  };

  decoration = {
    rounding = 8;

    blur = {
      enabled = true;
      size = 6;
      passes = 2;
    };

    shadow = {
      enabled = true;
      range = 10;
      render_power = 3;
    };
  };

  animations = {
    enabled = true;

    bezier = [
      "ease, 0.25, 0.1, 0.25, 1.0"
    ];

    animation = [
      "windows, 1, 7, ease"
      "windowsOut, 1, 7, ease"
      "fade, 1, 7, ease"
      "workspaces, 1, 6, ease"
    ];
  };

  input = {
    kb_layout = "dk";

    touchpad = {
      natural_scroll = true;
    };
  };

  bind = import ./binds.nix;

  # gestures = {
  #   workspace_swipe = "on";
  # };

  env = [
    "XCURSOR_SIZE,24"
    "GTK_THEME,Adwaita:dark"
    "XDG_CURRENT_DESKTOP,Hyprland"
  ];

  "exec-once" = [
    "waybar"
    "cursor-clip --daemon"
    "mako"
  ];
}
