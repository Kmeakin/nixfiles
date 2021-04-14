{ config, lib, pkgs, ... }: {
  imports = lib.lists.map (module: import module { inherit config pkgs lib; })
    [
      ./steam.nix
    ];
}
