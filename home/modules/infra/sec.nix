# /modules/infra/sec.nix
{ config, lib, pkgs, ... }:

let
  cfg = config.modules.infra.sec;
in
{
  options.modules.infra.sec = {
    enable = lib.mkEnableOption "Security, GPG, password store tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      trivy
      sops
      ssh-to-age
    ];

    programs.password-store = {
      enable = true;
      package = pkgs.pass;
      settings = { PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store"; };
    };

    programs.gpg = { enable = true; };
    programs.browserpass = { enable = true; browsers = [ "chrome" ]; };

    # Decrypt the file purely as a security concern
    sops = {
      defaultSopsFile = ../../../secrets.yaml; 
      age.sshKeyPaths = [ "${config.home.homeDirectory}/.ssh/id_ed25519" ];
      
      secrets.gemini_free_key = {
        path = "${config.home.homeDirectory}/.config/gemini/free_tier_key";
      };
    };
  };
}
