{ config, lib, pkgs, ... }: {
   home.packages = with pkgs; [runelite multimc];
}
