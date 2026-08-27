{ config, lib, pkgs, ... }:

let
  cfg = config.modules.infra.cloud;
in
{
  options.modules.infra.cloud = {
    enable = lib.mkEnableOption "Cloud and Kubernetes infrastructure tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      kubectl
      dive
    ];

    programs.awscli = {
      enable = true;
      package = pkgs.awscli2;
      settings = {
        default = {
          region = "us-east-1";
          output = "json";
        };
      };
      credentials = {
        default = {
          credential_process = "${pkgs.pass}/bin/pass show aws";
        };
      };
    };
  };
}
