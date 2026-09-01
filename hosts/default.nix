{ pkgs, ... }:

{
  # Touch ID authentication for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # macOS System Defaults
  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      tilesize = 48;
      mru-spaces = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = true;
    };
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      ApplePressAndHoldEnabled = false; # Enable key-repeat (essential for Vim/Emacs)
      InitialKeyRepeat = 14;            # Delay until repeat starts (15ms * 14)
      KeyRepeat = 1;                    # Fast repeat rate (15ms * 1)
      "com.apple.sound.beep.feedback" = 0;
    };
    screencapture = {
      location = "~/Downloads";
      disable-shadow = true;
    };
    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
    };
  };

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

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
    gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 14d";
    };
    optimise.automatic = true;
    settings = {
      warn-dirty = false;
    };
  };

  programs.zsh.enable = true;
}
