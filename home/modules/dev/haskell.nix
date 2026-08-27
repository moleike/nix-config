{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.haskell;
in
{
  options.modules.dev.haskell = {
    enable = lib.mkEnableOption "Haskell development tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ghc
      cabal-install
      stack
      haskell-language-server
    ];
  };
}
