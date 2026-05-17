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
      key_path = ../../keys/u2f_keys.nix;
      # ykDisconnect = pkgs.writeShellScript "yk-disconnect.sh" ''
      #   ${pkgs.procps}/bin/pkill -USR1 swayidle
      # '';
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

        # services.udev.extraRules = ''
        #   ACTION=="remove", SUBSYSTEM=="usb", ENV{PRODUCT}=="1050/406/543", RUN+="${ykDisconnect} '%E{SEQNUM}'"
        # '';

        home-manager.users.johannes =
          { pkgs, ... }:
          {
            xdg.configFile."Yubico/u2f_keys".source = key_path;
          };
      };
    };
}
