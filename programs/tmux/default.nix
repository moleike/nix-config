{ ... } :
{
  programs.tmux = {
    enable = true;
    prefix = "C-b";
    keyMode = "vi";
    historyLimit = 50000;
    customPaneNavigationAndResize = true;
    extraConfig = ''
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
      bind '"' split-window -h
      bind '=' split-window -v
      set -g mouse on
    '';
  };
}
