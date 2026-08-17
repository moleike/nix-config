# hosts/netquest/default.nix
{ pkgs, lib, ... }:
{

  users.users."amoreno" = {
      name = "amoreno";
      home = "/Users/amoreno";
  };

  system.stateVersion = 5;

  system.primaryUser = "amoreno";

  nixpkgs.hostPlatform = "aarch64-darwin";

  nix = {
    package = pkgs.nix;
    settings = {
      trusted-users = [ "root" "amoreno" ];
      extra-experimental-features = [ "nix-command" "flakes" ];
      substituters = lib.mkForce [
        "https://cache.nixos.org"
      ];
      trusted-public-keys = lib.mkForce [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };
  };

  # zScaler root CA
  #nix.settings.ssl-cert-file = "/opt/zscaler.crt";
  #security.pki.certificates = [
  #  "/opt/zscaler.crt"
  #];

  programs.zsh.enable = true;
}
