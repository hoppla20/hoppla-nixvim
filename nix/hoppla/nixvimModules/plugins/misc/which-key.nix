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
    enable = mkEnableOption "which-key";
  };

  config = mkIf cfg.self.enable {
    plugins.which-key = {
      enable = true;
      layout.align = "center";
    };
  };
}
