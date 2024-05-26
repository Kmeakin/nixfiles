inputs @ { config, pkgs, ... }:

{
  home.packages = [
    (pkgs.fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rustfmt"
    ])
  ];
}
