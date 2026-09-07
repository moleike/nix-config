{ config, pkgs, ... }:
let
  theme = pkgs.fetchgit {
    url = "https://github.com/alacritty/alacritty-theme";
    rev = "14794c3cc2dc1b4649f8b9b79a8833d2ce5bfd60";
    sha256 = "mxmli6ZSm+90Jrwm9fju0sAstNZgBEx4hSaWigs6rWc=";
  };
  doomOne = builtins.fromTOML (builtins.readFile "${theme}/themes/doom_one.toml");
  font-family = "FiraCode Nerd Font";
  tmux-launcher = pkgs.writeShellScript "tmux-launcher" ''
    exec ${pkgs.tmux}/bin/tmux new-session -A -s main
  '';
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        live_config_reload = true;
      };

      colors = doomOne.colors;

      terminal.shell.program = "${tmux-launcher}";

      window = {
        option_as_alt = "Both";
        dynamic_title = true;
        startup_mode = "Maximized";
        decorations = "Buttonless";
        opacity = 0.80;
      };

      scrolling = {
        history = 10000;
      };

      cursor.style = "Block";

      font = {
        size = 18.0;

        normal.family = "${font-family}";
        normal.style = "Medium";

        bold.family = "${font-family}";
        bold.style = "Bold";

        italic.family = "${font-family}";
        italic.style = "Light Italic";
      };
    };
  };
}
