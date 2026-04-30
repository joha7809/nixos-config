{ ... }: {
  xdg.configFile."hypr/hyprland.conf".text = ''
    $mod = SUPER
    bind = $mod, RETURN, exec, kitty
    bind = $mod, D, exec, wofi --show drun
    bind = $mod, V, exec, cursor-clip

    input {
      kb_layout = dk
      kb_variant =
      kb_model =
      kb_rules =
    }

    exec-once = waybar
    exec-once = cursor-clip --daemon
  '';
}
