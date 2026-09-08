{
  description = "Rust development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay, treefmt-nix, pre-commit-hooks }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (import rust-overlay) ];
        };

        rustToolchain = pkgs.rust-bin.stable.latest.default.override {
          extensions = [ "rust-src" "rust-analyzer" ];
        };

        treefmtConfig = treefmt-nix.lib.evalModule pkgs {
          projectRootFile = "flake.nix";
          programs.rustfmt.enable = true;
        };

        preCommitCheck = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            treefmt.enable = true;
            treefmt.package = treefmtConfig.config.build.wrapper;
          };
        };
      in {
        formatter = treefmtConfig.config.build.wrapper;
        checks.pre-commit-check = preCommitCheck;

        devShells.default = pkgs.mkShell {
          shellHook = preCommitCheck.shellHook;
          nativeBuildInputs = [
            rustToolchain
            treefmtConfig.config.build.wrapper
          ];

          RUST_SRC_PATH = "${rustToolchain}/lib/rustlib/src/rust/library";
        };
      });
}
