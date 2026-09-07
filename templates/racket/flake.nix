{
  description = "Racket development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            racket
          ];

          shellHook = ''
            export PLTUSERHOME="$PWD/.racket-local"
            export PATH="$PLTUSERHOME/bin:$PATH"
            
            if [ ! -d "$PLTUSERHOME" ]; then
              echo "Initializing local Racket package layer..."
              raco pkg install --auto --batch racket-langserver
            fi
          '';
        };
      });
}
