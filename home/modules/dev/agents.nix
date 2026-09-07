# /modules/dev/agents.nix
{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.agents;

  keyPath = if (config ? sops.secrets.gemini_free_key)
    then config.sops.secrets.gemini_free_key.path
    else "";
in
{
  options.modules.dev.agents = {
    enable = lib.mkEnableOption "LLM and AI coding agent tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      claude-code
      codex
      antigravity-cli
    ];

    home.sessionVariables = lib.mkIf (config ? sops.secrets.gemini_free_key) {
      GEMINI_API_KEY = "$(cat ${config.sops.secrets.gemini_free_key.path})";
    };

    home.file.".gemini/antigravity-cli/settings.json" = {
      text = builtins.toJSON {
        modelProvider = "gemini";
        model = "Gemini 3.6 Flash";
      };
      
      force = true; 
    };
  };
}
