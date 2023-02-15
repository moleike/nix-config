# hosts/netquest/default.nix
{ pkgs, lib, ... }:
{

  users.users."Alex.Moreno" = {
      name = "Alex.Moreno";
      home = "/Users/Alex.Moreno";
  };


  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;
  
  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh.enable = true;
  # bash is enabled by default

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
    ];
  };

}
