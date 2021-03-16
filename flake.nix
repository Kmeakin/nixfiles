{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nipkgs.follows = "nixpkgs";
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nipkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { home-manager, nixpkgs, flake-utils, fenix, ... }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        {
          devShell = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              gnumake
              stow
            ];
          };

          nixosConfigurations = {
            "Desktop" = nixpkgs.lib.nixosSystem {
              system = "x86_64-linux";
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

                ./hosts/desktop.nix
                home-manager.nixosModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.users.karl = import ./home;
                }
              ];
            };
          };
        }
    );
}
