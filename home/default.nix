{ config, pkgs, lib, ... }:

{
  imports = [ ./programs ];

  home.packages = with pkgs; [
    jq
    fd
    gh
    ripgrep
    dive
    # ngrok
    nix
    cachix
    comma
    nix-index
    jdk17
    rustup
    maven
    coursier
    sbt
    metals
    scala-cli
    hyperfine
    fira-code
    fira-code-symbols
    kubectl
    tokei
    zstd
    ispell
    fontconfig
    pandoc
    trivy
    hugo
    # racket-minimal
    nodejs_22
    pipenv
    (python312.withPackages (python-pkgs: with python-pkgs; [
      pytest
      pylint
      python-lsp-server
      matplotlib
    ]))
    # proof assistants
    lean4
    coq
    (agda.withPackages [ agdaPackages.standard-library ])
    # agents
    llm-agents.claude-code
    llm-agents.codex
    llm-agents.gemini-cli
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with.
  home.stateVersion = "23.11";

  xdg.enable = true;

  home.file = {
    "agda/defaults".text = "standard-library";
  };

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.password-store = {
    enable = true;
    package = pkgs.pass;
    settings = {
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
    };
  };

  programs.gpg = {
    enable = true;
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

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };
}
