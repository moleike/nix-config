{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Alexandre Moreno";
        email = "alexmorenocano@gmail.com";
      };

      color.ui = true;
      pull.rebase = true;
      merge.conflictstyle = "diff3";
      github.user = "moleike";
      includeIf."gitdir:~/Playground/".path = "~/Playground/.gitconfig";
      http.sslVerify = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
