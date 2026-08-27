{
  # MacOS native apps not in nixpkgs (Xcode can't be packaged with Nix)
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
    enableZshIntegration = true;

    casks = [
      "slack"
      # "docker"
      "postman"
      "zoom"
      "loom"
      "notion"
      "google-chrome"
      "google-drive"
      "dbeaver-community"
      "discord"
      # "whatsapp"
      "spotify"
      "wireshark-app"
      "httpie-desktop"
      "jdk-mission-control"
      "lens"
      "racket"
    ];

    brews = [
      "kitlangton/tap/scala-update"
      # "acl2"
      "flatbuffers"
    ];
  };
}
