{ config, lib, ... }:

let
  cfg = config.modules.dev.racket;
in
{
  options.modules.dev.racket = {
    enable = lib.mkEnableOption "Racket development setup and LSP";
  };

  config = lib.mkIf cfg.enable {
    home.activation.setupRacketLsp = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi

      if [ -x "$(command -v raco)" ]; then
        echo "Checking declarative Racket LSP dependencies via Homebrew..."
        $DRY_RUN_CMD raco pkg install --skip-installed --deps search-auto racket-langserver || true
      else
        echo "Warning: 'raco' binary not found. Make sure Racket is installed"
      fi
    '';
  };
}
