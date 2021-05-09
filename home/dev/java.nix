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
}
