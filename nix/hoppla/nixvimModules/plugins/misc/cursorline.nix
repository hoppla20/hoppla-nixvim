# https://nix-community.github.io/nixvim/plugins/cursorline
_: {
  lib,
  cfg,
  ...
}: let
  inherit
    (lib)
    mkOption
    mkEnableOption
    mkIf
    mkMerge
    types
    ;
in {
  options = {
    enable = mkEnableOption "cursorline";
  };

  config = mkIf cfg.self.enable {
    plugins.cursorline = {
      enable = true;
      cursorline.timeout = 618;
    };
  };
}
