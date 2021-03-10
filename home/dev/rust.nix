{ config, lib, pkgs, fenix, ... }: {
  home.packages = with pkgs; [
    (
      with rust-nightly;
      combine (
        with latest; [
          cargo
          clippy-preview
          rust-std
          rustc
          rustfmt-preview
          rust-src
        ]
      )
    )

    cargo-edit
    cargo-insta
    cargo-expand

    sccache
  ];

  home.sessionVariables = {
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    RUSTC_WRAPPER = "sccache";
  };

  programs.vscode.extensions = with pkgs.vscode-extensions; [];
}
