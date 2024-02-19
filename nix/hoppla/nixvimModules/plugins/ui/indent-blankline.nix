{
  nixpkgs,
  nixvim,
}: {
  lib,
  config,
  cfg,
  helpers,
  ...
}: let
  inherit
    (lib)
    mkOption
    mkEnableOption
    mkIf
    types
    ;
in {
  options = {
    enable = mkEnableOption "indent-blankline";
  };

  config = mkIf cfg.self.enable {
    plugins.indent-blankline.enable = true;
  };
}
