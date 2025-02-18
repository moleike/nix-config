{ config, pkgs, ... } :
let
  theme = pkgs.fetchgit {
    url = "https://github.com/alacritty/alacritty-theme";
    rev = "14794c3cc2dc1b4649f8b9b79a8833d2ce5bfd60";
    sha256 = "mxmli6ZSm+90Jrwm9fju0sAstNZgBEx4hSaWigs6rWc=";
  };
in
{
  home.file."colors.toml".text = builtins.readFile "${theme}/themes/afterglow.toml";

  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        live_config_reload = true;
        import = [ "${config.home.homeDirectory}/colors.toml" ];
      };

      terminal.shell.program = "${pkgs.tmux}/bin/tmux";

      window = {
        dynamic_title = true;
        startup_mode = "Maximized";
        decorations = "Buttonless";
        opacity = 0.90;
      };

      scrolling = {
        history = 50000;
      };

      cursor.style = "Block";

      font = {
        size = 18.0;

        normal.family = "Fira Code";
        normal.style = "Medium";

        bold.family = "Fira Code";
        bold.style = "Bold";

        italic.family = "Fira Code";
        italic.style = "Light Italic";
      };
    };
  };
}
