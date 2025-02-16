{ pkgs, ... }:
let theme = pkgs.fetchgit {
    url = "https://github.com/alacritty/alacritty-theme";
    rev = "14794c3cc2dc1b4649f8b9b79a8833d2ce5bfd60";
    sha256 = "mxmli6ZSm+90Jrwm9fju0sAstNZgBEx4hSaWigs6rWc=";
    };
in {
  home.file."colors.toml".text = builtins.readFile "${theme}/themes/afterglow.toml";
}
