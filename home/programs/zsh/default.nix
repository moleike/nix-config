{ config, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    completionInit = "autoload -U compinit && compinit -C -d ~/.cache/zcompdump";
    syntaxHighlighting.enable = true;
    history = {
      share = false;
      size = 10000;
      save = 10000;
    };
    shellAliases = import ./aliases.nix;
    sessionVariables = rec {
      EDITOR = "emacsclient -c";
      VISUAL = EDITOR;
      GIT_EDITOR = EDITOR;
      PATH = "$HOME/.emacs.d/bin:$HOME/bin:$PATH";
    };
    dotDir = "${config.xdg.configHome}/zsh";
  };
}
