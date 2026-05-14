{ inputs, lib, ... }:
{
  flake.nixosModules.clipboard =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.cursor-clip
      ];
    };
}
