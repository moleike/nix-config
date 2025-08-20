{
  # MacOS native apps not in nixpkgs (Xcode can't be packaged with Nix)
  homebrew = {
    enable = true;
    onActivation.autoUpdate = false;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    casks = [
      "slack"
      # "docker"
      "postman"
      "zoom"
      "loom"
      "notion"
      "google-drive"
      "dbeaver-community"
      "discord"
      "whatsapp"
      "spotify"
      "wireshark"
      "httpie"
      "jdk-mission-control"
    ];

    brews = [
      "kitlangton/tap/scala-update"
      "acl2"
    ];
  };
}
