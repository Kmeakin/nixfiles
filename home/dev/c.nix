inputs @ { config, pkgs, ... }:

{
  home.packages = [
    # Clang and GCC both provide a `cc` binary. 
    # Mark GCC as higher priority so it gets precedence.
    (pkgs.hiPrio pkgs.gcc)
    pkgs.clang
  ];
}
