{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.rust;
in
{
  options.modules.dev.rust = {
    enable = lib.mkEnableOption "Rust development tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      rustup
    ];
  };
}
