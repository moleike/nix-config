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
    fd
    ripgrep
    # ngrok
    nix
    comma
    nix-index
    maven
    coursier
    sbt
    metals
    ammonite
    hyperfine
    fira-code
    fira-code-symbols
    kubectl
    tokei
    zstd
    git-credential-1password
    fontconfig
    pandoc
    trivy
    hugo
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "Alex.Moreno";
  #home.homeDirectory = "/Users/Alex.Moreno";

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
  home.stateVersion = "23.11";

  xdg.enable = true;

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.password-store = {
    enable = true;
    package = pkgs.pass;
  };

  programs.gpg = {
    enable = true;
  };

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

  programs.awscli = {
    enable = true;
    package = pkgs.awscli2;
    settings = {
      default = {
        region = "us-east-1";
        output = "json";
      };
    };
    credentials = {
      default = {
        credential_process = "${pkgs.pass}/bin/pass show aws";
      };
    };
  };

  programs.browserpass = {
    enable = true;
    browsers = [ "chrome" ];
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config.global = {
      load_dotenv = true;
      strict_env = true;
    };
  };

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
    '';
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
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

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "*.netquest-apps.com" = {
        user = "amoreno";
      };
    };
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
