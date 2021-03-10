{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nipkgs.follows = "nixpkgs";
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nipkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { home-manager, nixpkgs, fenix, ... }: {
    nixosConfigurations = {
      "Desktop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (
            { pkgs, ... }: {
              nix = {
                autoOptimiseStore = true;
                extraOptions = "experimental-features = flakes nix-command";
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
  };
}
