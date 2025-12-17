{
  description = "MiniOS – lightweight directory-aware dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    systems = [ "x86_64-linux" "aarch64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in
  {
    packages = forAllSystems (system:
      import ./pkgs {
        pkgs = import nixpkgs { inherit system; };
      }
    );

    devShells = forAllSystems (system:
      import ./devShells/default.nix {
        pkgs = import nixpkgs { inherit system; };
      }
    );

    nixosModules = {
      miniOS-core = ./modules/miniOS-core.nix;
    };
  };
}
