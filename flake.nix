{
  description = "Alex's work/home laptop nixos config";

  inputs = {
      nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-24.11-darwin;
      home-manager.url = github:nix-community/home-manager/release-24.11;
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
      mac-app-util.url = "github:hraban/mac-app-util";
  };
  
  outputs = { self, nixpkgs, home-manager, nix-darwin, mac-app-util, ... }: {
    darwinConfigurations = rec {
      M-Y3NWTMF3DL = nix-darwin.lib.darwinSystem {
        # you can have multiple darwinConfigurations per flake, one per hostname
        system = "aarch64-darwin";
        modules = [
          ./homebrew
          ./hosts/netquest
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            nixpkgs = {
              config = {
                allowUnfree = true;
                # https://github.com/NixOS/nixpkgs/pull/172397
                allowBroken = true;
              };
            };

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."Alex.Moreno" = {
              imports = [
                ./home.nix
                mac-app-util.homeManagerModules.default
              ];
            };
          }
        ];

      };
    };
  };
}
