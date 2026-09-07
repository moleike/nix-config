{
  description = "Alex's work/home laptop nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    nix-doom-emacs-unstraightened.url = "github:marienz/nix-doom-emacs-unstraightened";
    mac-app-util.url = "github:hraban/mac-app-util";
    llm-agents.url = "github:numtide/llm-agents.nix";
  };
  
  outputs = inputs: with inputs; rec {
    darwinConfigurations =
      let configure = hostname: system: nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit hostname inputs; };

        modules = [
          ./homebrew
          ./hosts/${hostname}
          sops-nix.darwinModules.sops
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            nixpkgs = {
              config = {
                allowUnfree = true;
                # https://github.com/NixOS/nixpkgs/pull/172397
                allowBroken = true;
              };
              overlays = [
                llm-agents.overlays.shared-nixpkgs
              ];
            };

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."amoreno" = {
                imports = [
                  ./home
                  ./hosts/${hostname}/home.nix
                  sops-nix.homeManagerModules.sops
                  mac-app-util.homeManagerModules.default
                  nix-doom-emacs-unstraightened.hmModule
                ];
              };
            };
          }
        ];
       }; in {
         ESM-Y3NWTMF3DL = configure "netquest" "aarch64-darwin";
       };

    templates = import ./templates;
  };
}
