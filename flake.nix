{
  description = "Alex's work/home laptop nixos config";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
      nixpkgs-unstable.url = github:NixOS/nixpkgs/nixpkgs-unstable;
      home-manager.url = "github:nix-community/home-manager/release-23.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
      # nix will normally use the nixpkgs defined in home-managers inputs, we only want one copy of nixpkgs though
      darwin.url = "github:lnl7/nix-darwin";
      darwin.inputs.nixpkgs.follows = "nixpkgs";
      flake-utils.url = "github:numtide/flake-utils";
  };
  
  outputs = { self, nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations = rec {
      M-Y3NWTMF3DL = darwin.lib.darwinSystem {
        # you can have multiple darwinConfigurations per flake, one per hostname
        system = "aarch64-darwin";
        modules = [ 
          ./hosts/netquest/default.nix
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
            home-manager.users."Alex.Moreno" = import ./home.nix;
          }
        ];

      };
    };
  };
}
