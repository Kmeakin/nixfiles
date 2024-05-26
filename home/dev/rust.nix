inputs @ { pkgs, ... }:

let
  rust-toolchain = pkgs.fenix.complete.withComponents [
    "cargo"
    "clippy"
    "rustfmt"
    "rust-src"
  ];
in
{
  home.packages = [
    rust-toolchain
  ];

  programs.vscode.extensions = [
    pkgs.fenix.rust-analyzer-vscode-extension
  ];
}
