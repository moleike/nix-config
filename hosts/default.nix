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
      ApplePressAndHoldEnabled = false; # Enable press-and-hold for key accent menu
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
        "https://nix-community.cachix.org"
        "https://nix-darwin.cachix.org"
        "https://nix-doom-emacs-unstraightened.cachix.org"
        "https://numtide.cachix.org"
        "https://haskell-language-server.cachix.org"
        "https://lean4.cachix.org"
      ];

      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-darwin.cachix.org-1:LxMyKzQk7Uqkc1Pfq5uhm9GSn07xkERpy+7cpwc006A="
        "doom-emacs-unstraightened.cachix.org-1:O5oOlRPnmQEvVaFyuMTmthCEooHbrg54WgSLR07tmg4="
        "numtide.cachix.org-1:2ps1kLBUW3qMicqP8rBUe216APD06K/40/UAMiC30L8="
        "haskell-language-server.cachix.org-1:juFfHrwkOxqIOZShtC4YC1uT1bBcq2RSvC7OMKx0Nz8="
        "lean4.cachix.org-1:mawtxSxcaiWE24xCXXgh3qnvlTkyU7evRRnGeAhD4Wk="
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
