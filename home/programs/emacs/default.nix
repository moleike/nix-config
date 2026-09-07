{ pkgs, config, ... }:

{
  programs.doom-emacs = {
    enable = true;
    doomDir = ./.doom.d;
    doomLocalDir = "${config.xdg.dataHome}/nix-doom";
    extraBinPackages = [
      pkgs.direnv
      pkgs.ripgrep
      pkgs.fd
      pkgs.git
    ];
  };

  services.emacs.enable = false;

  home.packages = [
    (pkgs.writeShellScriptBin "ec" ''
      exec ${pkgs.emacs}/bin/emacsclient -c -a "" "$@"
    '')

    (pkgs.writeShellScriptBin "et" ''
      exec ${pkgs.emacs}/bin/emacsclient -nw -a "" "$@"
    '')
  ];
}
