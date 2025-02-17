# hosts/netquest/default.nix
{ pkgs, lib, ... }:
{

  users.users."Alex.Moreno" = {
      name = "Alex.Moreno";
      home = "/Users/Alex.Moreno";
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

  # MacOS native apps not in nixpkgs (Xcode can't be packaged with Nix)
  homebrew = {
    enable = true;
    onActivation.autoUpdate = false;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    casks = [
      "slack"
      "docker"
      "postman"
      "zoom"
      "loom"
      "notion"
      "google-drive"
      "dbeaver-community"
      "discord"
      "whatsapp"
      "spotify"
      "whalebird"
      "wireshark"
      "httpie"
      "jdk-mission-control"
    ];

    brews = [
      "kitlangton/tap/scala-update"
    ];
  };

}
