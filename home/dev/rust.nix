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
    cargo-expand

    sccache
  ];

  home.sessionVariables = {
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    RUSTC_WRAPPER = "sccache";

    # needed for `cargo expand`
    RUSTFMT = "$(which rustfmt)";
  };

  programs.vscode.extensions = with pkgs.vscode-extensions; [
    matklad.rust-analyzer
  ] ++ (
    pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-toml";
        publisher = "bungcip";
        version = "0.3.2";
        sha256 = "g+LfgjAnSuSj/nSmlPdB0t29kqTmegZB5B1cYzP8kCI=";
      }
      {
        name = "insta";
        publisher = "mitsuhiko";
        version = "1.0.6";
        sha256 = "sha256-Z/bU7h0GJyHBXNwk7uSsOPdRf3RzJcwWroWgXZnlAbA=";
      }
    ]
  );
}
