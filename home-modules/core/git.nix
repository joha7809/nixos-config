{ ... }:
{
  programs = {
    git = {
      enable = true;
      settings.user = {
        name = "johannes-uruz";
        email = "jsi@uruzen.com";
      };
    };

    ssh.enable = true;

    ssh.matchBlocks = {
      "github-work" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/uruz/uruz";
        identitiesOnly = true;
      };
    };
  };
}
