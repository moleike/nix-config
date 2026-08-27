{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.java;
in
{
  options.modules.dev.java = {
    enable = lib.mkEnableOption "Java and JVM development tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      jdk17
      maven
    ];
  };
}
