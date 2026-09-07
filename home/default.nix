{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules
    ./programs
  ];

  # Core general packages enabled by default
  home.packages = with pkgs; [
    jq
    fd
    gh
    ripgrep
    nix
    cachix
    comma
    nix-index
    hyperfine
    tokei
    zstd
    ispell
    fontconfig
    pandoc
    hugo
    sops
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with.
  home.stateVersion = "23.11";

  xdg.enable = true;

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };
}
