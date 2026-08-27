{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.coq;
in
{
  options.modules.dev.coq = {
    enable = lib.mkEnableOption "Coq proof assistant";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      coq
    ];
  };
}
