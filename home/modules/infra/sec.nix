{ config, lib, pkgs, ... }:

let
  cfg = config.modules.infra.sec;
in
{
  options.modules.infra.sec = {
    enable = lib.mkEnableOption "Security, GPG, and password store tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      trivy
    ];

    programs.password-store = {
      enable = true;
      package = pkgs.pass;
      settings = {
        PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
      };
    };

    programs.gpg = {
      enable = true;
    };

    programs.browserpass = {
      enable = true;
      browsers = [ "chrome" ];
    };
  };
}
