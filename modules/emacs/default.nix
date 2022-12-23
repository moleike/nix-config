{ config, lib, pkgs, ... }:
{

  programs = {
    emacs.enable = true;
  };

  home.file.".doom.d" = {                       # Get Doom Emacs
    source = ./.doom.d;                         # Sets up symlink name ".doom.d" for file "doom.d"
    recursive = true;                           # Allow symlinking a directory
    onChange = ''
        DOOM="$HOME/.emacs.d"

        if [ ! -d "$DOOM" ]; then
          git clone --depth=1 https://github.com/doomemacs/doom-emacs.git $DOOM
          yes | $DOOM/bin/doom install
          rm -r $HOME/.doom.d
          ln -s $HOME/nix-config/modules/emacs/.doom.d $HOME/.doom.d
          $DOOM/bin/doom sync
        else
          $DOOM/bin/doom sync
        fi
      '';
  };

}
