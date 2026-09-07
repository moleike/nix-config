{ pkgs, ... }:

{
  # Touch ID authentication for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # macOS System Defaults
  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      tilesize = 52;
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
    nerd-fonts.fira-code
  ];

  nix = {
    package = pkgs.nix;
    settings = {
      trusted-users = [ "root" "amoreno" ];
      extra-experimental-features = [ "nix-command" "flakes" ];
      extra-substituters = [
        "https://nix-doom-emacs-unstraightened.cachix.org"
        "https://numtide.cachix.org"
      ];

      extra-trusted-public-keys = [
        "nix-doom-emacs-unstraightened.cachix.org-1:1x23G3T3S2Y2T2Y2T2Y2T2Y2T2Y2T2Y2T2Y2T2Y2T2Y=" # placeholder format, see note below
        "numtide.cachix.org-1:2ps1kLBUW3qMicqP8rBUe216APD06K/40/UAMiC30L8="
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
