{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    openjdk11
  ];

  home.sessionVariables = {
    _JAVA_OPTIONS = ''
      -Dawt.useSystemAAFontSettings=on
      -Dswing.aatext=true
      -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel
      -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel
    '';
  };

  programs.vscode.extensions = with pkgs.vscode-extensions; [] ++ (
    pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "java";
        publisher = "redhat";
        version = "0.76.0";
        sha256 = "XoyPhos3+fMllQIUI0M305pQWzT/4Ul2vABoEmdeaXU=";
      }
    ]
  );
}
