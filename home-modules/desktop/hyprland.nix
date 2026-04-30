{ ... }: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {

    monitor = ",preferred,auto,auto";

    "$mod" = "SUPER";
    bind = [
      "$mod, RETURN, exec, kitty"
      "$mod, D, exec, wofi --show drun"
      "$mod, V, exec, cursor-clip"
      "$mod, W, killactive,"
    ];

    input = {
      kb_layout = "dk";
      kb_variant = "";
      kb_model = "";
      kb_rules = "";

      touchpad = {
        natural_scroll = true;
      };
    };

    "exec-once" = [
      "waybar"
      "cursor-clip --daemon"
    ];
  };
}
