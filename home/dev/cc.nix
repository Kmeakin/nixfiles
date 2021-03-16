{ config, lib, pkgs, fenix, ... }: {
  home.packages = with pkgs; [
    clang
    clang-tools
    (pkgs.hiPrio gcc)
    gnumake
    binutils
  ];
}
