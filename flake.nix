{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nipkgs.follows = "nixpkgs";
  };

  outputs = { home-manager, nixpkgs, ... }: {
    nixosConfigurations = {
      "Desktop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
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
