{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  flake.nixosModules.auth =
    {
      pkgs,
      lib,
      inputs,
      ...
    }:

    let
      key_path = ../../keys/u2f_keys;
      ykDisconnect = pkgs.writeShellApplication {
        name = "yk-disconnect";
        text = ''
          ${pkgs.hyprland}/bin/hyprctl dispatch exec hyprlock
        '';
      };
    in
    {
      config = {
        security.pam = {
          services = {
            login.u2fAuth = true;
            sudo.u2fAuth = true;
          };
          u2f = {
            enable = true;
            cue = true;
          };
        };

        systemd.user.services.yubikey-lock = {
          enable = true;
          description = "Lock Hyprland when ubikey is ejected";
          serviceConfig = {
            Type = "oneshot";
            ExecStart = "${pkgs.hyprlock}/bin/hyprlock";
          };
        };

        # services.udev.extraRules = ''
        #   ACTION=="remove", SUBSYSTEM=="usb", ENV{PRODUCT}=="1050/407/574", RUN+="${ykDisconnect}"
        # '';

        services.udev.extraRules = ''
          ACTION=="remove", SUBSYSTEM=="usb", ENV{PRODUCT}=="1050/407/574", ENV{SYSTEMD_USER_WANTS}+="yubikey-lock.service"
        '';

        home-manager.users.johannes =
          { pkgs, ... }:
          {
            xdg.configFile."Yubico/u2f_keys".source = key_path;
          };
      };
    };
}
