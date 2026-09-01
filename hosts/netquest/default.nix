# hosts/netquest/default.nix
{ pkgs, lib, ... }:
{
  imports = [
    ../default.nix
  ];

  users.users."amoreno" = {
    name = "amoreno";
    home = "/Users/amoreno";
  };

  system.stateVersion = 5;

  system.primaryUser = "amoreno";

  nixpkgs.hostPlatform = "aarch64-darwin";

  nix = {
    settings = {
      trusted-users = [ "root" "amoreno" ];
    };
  };

  # zScaler root CA
  #nix.settings.ssl-cert-file = "/opt/zscaler.crt";
  #security.pki.certificates = [
  #  "/opt/zscaler.crt"
  #];
}
