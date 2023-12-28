# https://nix-community.github.io/nixvim/plugins/rainbow-delimiters
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
    enable = mkEnableOption "rainbow-delimeter";
  };

  config = mkIf cfg.self.enable {
    plugins.rainbow-delimiters.enable = true;
  };
}
