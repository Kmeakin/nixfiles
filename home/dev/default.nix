{ config, lib, pkgs, fenix, ... }: {
  imports = lib.lists.map (module: import module { inherit config pkgs fenix lib; })
    [
      ./cc.nix
      ./java.nix
      ./latex.nix
      ./nix.nix
      ./rust.nix
      ./python.nix
    ];
}
