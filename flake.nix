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
  
  outputs = inputs: with inputs; rec {
    darwinConfigurations =
      let configure = hostname: system: nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit hostname inputs; };

        modules = [
          ./homebrew
          ./hosts/${hostname}
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

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."amoreno" = {
                imports = [
                  ./home
                  ./hosts/${hostname}/home.nix
                  mac-app-util.homeManagerModules.default
                ];
              };
            };
          }
        ];
       }; in {
         ESM-Y3NWTMF3DL = configure "netquest" "aarch64-darwin";
       };
  };
}
