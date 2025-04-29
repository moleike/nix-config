{ config, pkgs, lib, ... }:
with pkgs;
{
  imports = [ ./programs ];

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
    fontconfig
    pandoc
    trivy
    hugo
    coq
    racket
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
