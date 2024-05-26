{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { ... }:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        ThinkPad-P1 = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/ThinkPad-P1.nix ];
        };
      };

      homeConfigurations = {
        karmea01 = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home ];
        };
      };
    };
}
