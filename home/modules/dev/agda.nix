{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.agda;
in
{
  options.modules.dev.agda = {
    enable = lib.mkEnableOption "Agda proof assistant and standard library";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      (agda.withPackages [ agdaPackages.standard-library ])
    ];

    home.file."agda/defaults".text = "standard-library";
  };
}
