# https://nix-community.github.io/nixvim/plugins/bufferline
# https://nix-community.github.io/nixvim/plugins/lualine
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
    enable = mkEnableOption "Lines";
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
