{ ... } :
{
  programs.git = {
    enable = true;
    userName = "Alexandre Moreno";
    userEmail = "alexmorenocano@gmail.com";
    delta.enable = true;
    extraConfig = {
      color.ui = true;
      pull.rebase = true;
      merge.conflictstyle = "diff3";
      github.user = "moleike";
      url."ssh://git@github.com/nqcentral/".insteadOf = [
        "https://github.com/nqcentral/"
        "git@github.com:nqcentral/"
      ];
      url."ssh://git@github.com/amoreno-netquest/".insteadOf = [
        "https://github.com/amoreno-netquest/"
        "git@github.com:amoreno-netquest/"
      ];
      includeIf."gitdir:~/Playground/".path = "~/Playground/.gitconfig";
    };
  };
}
