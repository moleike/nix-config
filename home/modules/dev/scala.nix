{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.scala;
in
{
  options.modules.dev.scala = {
    enable = lib.mkEnableOption "Scala and JVM development tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      jdk17
      maven
      coursier
      sbt
      metals
      scala-cli
    ];
  };
}
