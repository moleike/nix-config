{ pkgs, ... }:
let theme = pkgs.fetchgit {
    url = "https://github.com/eendroroy/alacritty-theme";
    rev = "567912a278cca356e8aa81ec748759c8e048d0ec";
    sha256 = "cDhcdEDwdJeVoFr8NATZ43e/xhZ7N0mUnd1yfyfpq1I=";
    };
in {
  home.file."colors.yml".text = builtins.readFile "${theme}/themes/nord.yaml";
}
