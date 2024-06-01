inputs @ { pkgs, ... }:
let
  rust-toolchain =
    pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
      extensions = [ "rust-src" ];
      targets = [ "aarch64-unknown-linux-gnu" ];
    });
in
{
  home.packages = [ rust-toolchain ];

  programs.vscode.extensions = with pkgs.vscode-extensions; [
    rust-lang.rust-analyzer
    tamasfe.even-better-toml
  ];
}
