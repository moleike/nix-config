{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.nodejs;
in
{
  options.modules.dev.nodejs = {
    enable = lib.mkEnableOption "Node.js environment";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs_22
    ];
  };
}
