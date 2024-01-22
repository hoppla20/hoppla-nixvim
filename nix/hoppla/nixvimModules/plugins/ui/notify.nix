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
    enable = mkEnableOption "notify";
  };

  config = mkIf cfg.self.enable {
    plugins.notify = {
      enable = true;
      render = "minimal";
    };
  };
}
