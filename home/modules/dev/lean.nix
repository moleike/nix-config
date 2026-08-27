{ config, lib, pkgs, ... }:

let
  cfg = config.modules.dev.lean;
in
{
  options.modules.dev.lean = {
    enable = lib.mkEnableOption "Lean 4 theorem prover";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      lean4
    ];
  };
}
