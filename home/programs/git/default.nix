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
      includeIf."gitdir:~/Playground/".path = "~/Playground/.gitconfig";
    };
  };
}
