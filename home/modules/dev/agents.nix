{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.agents;
in
{
  options.modules.dev.agents = {
    enable = lib.mkEnableOption "LLM and AI coding agent tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      llm-agents.claude-code
      llm-agents.codex
      llm-agents.antigravity-cli
      llm-agents.copilot-cli
    ];
  };
}
