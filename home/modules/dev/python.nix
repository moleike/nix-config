{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.python;
in
{
  options.modules.dev.python = {
    enable = lib.mkEnableOption "Python development environment";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      pipenv
      (python312.withPackages (python-pkgs: with python-pkgs; [
        pytest
        pylint
        python-lsp-server
        matplotlib
      ]))
    ];
  };
}
