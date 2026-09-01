{ pkgs, config, ... }:

{
  programs.doom-emacs = {
    enable = true;
    doomdir = ./.doom.d;
    doomlocaldir = "${config.xdg.datahome}/nix-doom";
  };

  services.emacs.enable = false;

  home.packages = [
    (pkgs.writeshellscriptbin "ec" ''
      exec ${pkgs.emacs}/bin/emacsclient -c -a "" "$@"
    '')

    (pkgs.writeshellscriptbin "et" ''
      exec ${pkgs.emacs}/bin/emacsclient -nw -a "" "$@"
    '')
  ];
}
