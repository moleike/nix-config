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
      "extra-experimental-features" = [ "nix-command" "flakes" ];
    };
  };

  # zScaler root CA
  #nix.settings.ssl-cert-file = "/opt/zscaler.crt";
  #security.pki.certificates = [
  #  "/opt/zscaler.crt"
  #];

  programs.zsh.enable = true;
}
