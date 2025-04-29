# hosts/netquest/default.nix
{ pkgs, lib, ... }:
{

  users.users."amoreno" = {
      name = "amoreno";
      home = "/Users/amoreno";
  };

  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;

  # zScaler root CA
  #nix.settings.ssl-cert-file = "/opt/zscaler.crt";
  #security.pki.certificates = [
  #  "/opt/zscaler.crt"
  #];

  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh.enable = true;

  #environment.systemPackages = [
  # pkgs.python39Packages.pip
  # pkgs.python39Packages.python-lsp-server
  # pkgs.python39Packages.pylsp-mypy
  #];


}
