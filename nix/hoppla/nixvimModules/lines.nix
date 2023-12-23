_: {
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
in {
  options = {
    enable = mkEnableOption "Lines" // {default = true;};
  };

  config = mkIf cfg.self.enable {
    plugins = {
      bufferline = {
        enable = true;
      };

      lualine = {
        enable = true;
      };
    };
  };
}
