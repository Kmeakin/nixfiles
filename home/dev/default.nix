{ config, lib, pkgs, fenix, ... }: {
  imports = lib.lists.map (module: import module { inherit config pkgs fenix lib; })
    [
      ./cc.nix
      ./git.nix
      ./nix.nix
      ./rust.nix
      ./shell.nix
    ];
}
