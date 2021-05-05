{ config, lib, pkgs, ... }: {
  imports = lib.lists.map (module: import module { inherit config pkgs lib; })
    [
      ./minecraft.nix
    ];
}
