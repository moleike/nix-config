# hosts/netquest/default.nix
{ pkgs, lib, ... }:
{

  users.users."Alex.Moreno" = {
      name = "Alex.Moreno";
      home = "/Users/Alex.Moreno";
  };

  # The platform the configuration will be used on.
  # nixpkgs.hostPlatform = "aarch64-darwin";

  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;

  # zScaler root CA
  nix.settings.ssl-cert-file = "/opt/zscaler.crt";
  security.pki.certificates = [
    "/opt/zscaler.crt"
  ];

  nix.extraOptions = ''
    max-jobs = auto  # Allow building multiple derivations in parallel
    keep-outputs = false
    # Allow fetching build results from the Lean Cachix cache
    trusted-substituters = https://lean4.cachix.org/
    trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= lean4.cachix.org-1:mawtxSxcaiWE24xCXXgh3qnvlTkyU7evRRnGeAhD4Wk=
  '';
  
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
    onActivation.autoUpdate = true;
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
      "visualvm"
    ];

    brews = [
      "kitlangton/tap/scala-update"
    ];
  };

}
