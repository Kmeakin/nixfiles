{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nipkgs.follows = "nixpkgs";
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nipkgs.follows = "nixpkgs";
    nixos-hardware.url = github:NixOS/nixos-hardware/master;
  };

  outputs = inputs @ { home-manager, nixpkgs, nixos-hardware, flake-utils, fenix, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkSystem = hostname: {
        "${hostname}" = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            (
              { pkgs, ... }: {
                nix = {
                  autoOptimiseStore = true;
                  extraOptions = ''
                    experimental-features = flakes nix-command # for `nix flake`
                    keep-outputs = true     # to stop output of `nix-shell` being GCed
                    keep-derivations = true # ditto
                  '';
                  nixPath = [ "nixos=${nixpkgs}" "nixpkgs=${nixpkgs}" ];
                  package = pkgs.nixUnstable;
                };

                nixpkgs = {
                  config.allowUnfree = true;
                  overlays = with inputs; [
                    fenix.overlay
                  ];
                };
              }
            )

            (./hosts + "/${hostname}.nix")
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users.karl = import ./home;
            }
          ];
        };
      };

      shells = flake-utils.lib.eachDefaultSystem (
        system: {
          devShell = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              gnumake
            ];
          };
        }
      );

      configurations = {
        nixosConfigurations = (mkSystem "Thinkpad") // (mkSystem "Desktop");
      };
    in
      shells // configurations;
}
