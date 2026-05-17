{

  # TODO: Make this into a option field where each host can pass in their monitor
  monitor = [ "DP-2,2560x1440@143.97Hz,auto,1" ];

  "$mod" = "SUPER";

  general = {
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
    "col.active_border" = "rgba(88c0d0ff)";
    "col.inactive_border" = "rgba(3b4252ff)";
    layout = "dwindle";
  };

  cursor = {
    no_hardware_cursors = true;
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

  # env = [
  #   "XCURSOR_SIZE,24"
  #   "GTK_THEME,Adwaita:dark"
  #   "XDG_CURRENT_DESKTOP,Hyprland"
  # ];

  "exec-once" = [
    # "hyprpaper"
    # "waybar"
    "noctalia-shell"
    "cursor-clip --daemon"
    # "mako"
  ];
}
