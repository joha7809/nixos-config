{ ... }: {
  xdg.configFile."hypr/hyprland.conf".text = ''
    $mod = SUPER
    bind = $mod, RETURN, exec, kitty
    bind = $mod, D, exec, wofi --show drun
  '';
}
