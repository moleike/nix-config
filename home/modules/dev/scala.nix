{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.scala;
in
{
  options.modules.dev.scala = {
    enable = lib.mkEnableOption "Scala development tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      coursier
      sbt
      scala-cli
    ];
  };
}
