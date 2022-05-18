{ config, pkgs, lib, ... }:
with pkgs;
{
  imports = [
    ./modules/emacs
    ./modules/ls-colors.nix
    ./modules/alacritty
  ];

  home.packages = with pkgs; [
    jq
    ripgrep
    # httpie # Like curl but more user friendly
    ngrok # expose local HTTP stuff publicly
    podman # docker alternative
    nix
    comma
    nix-index
    jdk
    sbt # scala build tool
    metals
    ammonite
    hyperfine
    fira-code
    fira-code-symbols
    awscli # Amazon Web Services CLI
    kubectl # Kubernetes CLI tool
    tokei # Handy tool to see lines of code by language
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "alexandre.moreno";
  home.homeDirectory = "/Users/alexandre.moreno";

  nixpkgs.config = {
    allowUnfree = true;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  xdg.enable = true;

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs = {
    emacs.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Alexandre Moreno";
    userEmail = "alexmorenocano@gmail.com";
  };

  programs.direnv = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
    prefix = "C-b";
    keyMode = "vi";
    reverseSplit = true;
    customPaneNavigationAndResize = true;
    extraConfig = ''
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
    '';
  };


  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    history = {
      share = true;
      size = 50000;
      save = 50000;
    };
    shellAliases = import ./aliases.nix;
    oh-my-zsh = {
      enable = true;
      plugins = [ "tmux" ];
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

  programs.ssh = {
    enable = true;
  };

  # programs.starship = {
  #   enable = true;
  # };

  programs.alacritty = {
    enable = true;
    settings = {
      # env.TERM = "xterm-256color";
      live_config_reload = true;
      window = {
        title = "Terminal";
        startup_mode = "Maximized";
        decorations = "full";
        opacity = 0.95;
      };

      font = {
        size = 18.0;

        normal.family = "Fira Code";
        normal.style = "Medium";

        bold.family = "Fira Code";
        bold.style = "Bold";

        italic.family = "Fira Code";
        italic.style = "Light Italic";
      };

      cursor.style = "Block";
      key_bindings = [{
        key = "Return";
        mods = "Control|Shift";
        action = "SpawnNewInstance";
      }];

      import = [ "${config.home.homeDirectory}/colors.yml" ];
    };
  };

}
