{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    (texlive.combine { inherit (texlive) scheme-full latexindent latexmk; })
    python3Packages.pygments
  ];

  programs.vscode.extensions = with pkgs.vscode-extensions; [] ++ (
    pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        publisher = "James-Yu";
        name = "latex-workshop";
        version = "8.16.1";
        sha256 = "aRv5LaIds6j+TLZWmv1lb3SbxC65d31kyWsAcL5x9jY=";
      }
    ]
  );
}
