{ ... } :
{
  imports = [
    ./dircolors.nix
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history = {
      share = true;
      size = 50000;
      save = 50000;
    };
    shellAliases = import ./aliases.nix;
    oh-my-zsh = {
      enable = true;
      theme = "lambda";
      plugins = [
        "tmux"
      ];
    };
    sessionVariables = rec {
      EDITOR = "emacsclient -c";
      VISUAL = EDITOR;
      GIT_EDITOR = EDITOR;
      PATH = "$HOME/.emacs.d/bin:$HOME/bin:$PATH";
      ZSH_TMUX_AUTOSTART = true;
      ZSH_TMUX_CONFIG = "$XDG_CONFIG_HOME/tmux/tmux.conf";
    };
  };
}
