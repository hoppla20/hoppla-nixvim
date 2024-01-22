_: {
  config,
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
    enable = mkEnableOption "leap";
  };

  config = mkIf cfg.self.enable {
    plugins.leap.enable = true;
  };
}
