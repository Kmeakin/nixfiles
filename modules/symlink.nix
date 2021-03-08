{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.symlinks;
in
{
  options.symlinks = {
    enable = mkEnableOption "Creation of symlinks";
    files = mkOption {
      # TODO type = fileType cfg.homeDirectory;
      default = {};
      description = "Attribute set of files to link into the user's home directory.";
    };
  };


  config = mkMerge [
    (
      mkIf cfg.enable {
        home.activation.mkSymlinks =
          let
            lines =
              mapAttrsToList (name: value: "mkdir -p $(dirname ${name}) && ln -sf ${value} ${name}") cfg.files;
            script = builtins.trace lines concatStringsSep "\n" lines;
          in
            builtins.trace
              script
              lib.hm.dag.entryAfter [ "writeBoundary" ] script;
      }
    )
  ];
}
