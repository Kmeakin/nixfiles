{ pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
  ];

   programs.home-manager = {
    enable = true;
  };
}
