{ config, pkgs, lib, ... }:
with pkgs;
{
  imports = [ ./programs ];

  home.packages = with pkgs; [
    jq
    fd
    ripgrep
    semgrep
    dive
    # ngrok
    nix
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
    coq
    racket-minimal
    pipenv
    nodejs_22
    (agda.withPackages [ agdaPackages.standard-library ])
    (python311.withPackages (python-pkgs: with python-pkgs; [
      pytest
      pylint
      python-lsp-server
      pylsp-mypy
    ]))
    lean4
  ];

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

  home.file = {
        "agda/defaults".text = "standard-library";
      };

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
  };

  # programs.starship = {
  #   enable = true;
  # };


}
