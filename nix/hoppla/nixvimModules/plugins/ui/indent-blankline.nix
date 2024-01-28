{
  nixpkgs,
  nixvim,
}: {
  lib,
  config,
  cfg,
  ...
}: let
  inherit
    (lib)
    mkOption
    mkEnableOption
    mkIf
    types
    ;

  inherit (nixvim.lib) helpers;
in {
  options = {
    enable = mkEnableOption "indent-blankline";
  };

  config = mkIf cfg.self.enable {
    plugins.indent-blankline.enable = true;
  };
}
