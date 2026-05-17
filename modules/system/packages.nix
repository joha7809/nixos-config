{ ... }:
{
  flake.nixosModules.system-packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        git
        curl
        wget
        codex

        # For programming
        nil
        btop
        neo
        yazi
      ];
    };
}
